package cmd

import ( // {{{1
	"fmt"
	"log"

	"github.com/spf13/cobra"
	"github.com/stellar/go/clients/horizonclient"
	"github.com/stellar/go/keypair"
	"github.com/stellar/go/network"
	"github.com/stellar/go/txnbuild"
)

/*
  See also:
	- https://pkg.go.dev/github.com/stellar/go/clients/horizonclient?tab=doc
*/

var addaccountCmd = &cobra.Command{ // {{{1
	Use:   "addaccount",
	Short: "Adds new account, returns its address and seed",
	Long: `Adds new account, returns its address and seed. If the accountSeed flag 
is given, it specifies the source account that funds the new account. If the amount
flag is given, it specifies the amount of XLM to fund the new account. Otherwise,
the default amount is 500 XLM.

Without the accountSeed flag, a new source account gets created and funded by the
friendbot. If the amount flag is given, it is being ignored.`,
	Example: `  conf addaccount
- new source account added:
     seed SA6OPLUHQVKZXMHKSFT3NMOYZWRSYZGQLHEBPL4OYXE4UKDYPGK3XT77
  address GCPH53LQAAR43MTWFZ3YCMEUATJ4URN2CX47TXVMPE5N74BHBN3LQGXZ
   amount 10000.0000000 XLM
	
  conf addaccount \
  --accountSeed SA6OPLUHQVKZXMHKSFT3NMOYZWRSYZGQLHEBPL4OYXE4UKDYPGK3XT77
- new account added:
     seed SCCS7XNIT4SJ2AMVTX2RCRJJLHOWB74C2MY26MENUCHDEWV7RH6QYLLM
  address GBJIIGAC5IUGL7NEJJQ7T5E6U2UGNAFDSE4TK2T2BZMBSISXCBFTX77G
   amount 500.0000000 XLM
`,
}

func init() { // {{{1
	options := inputs{}
	options.accountSeed = addaccountCmd.Flags().StringP("accountSeed", "", "", "the seed of the source account")
	options.amount = addaccountCmd.Flags().StringP("amount", "", "500", "the amount of XLM to fund the new account")

	addaccountCmd.Run = func(ccmd *cobra.Command, args []string) {
		addaccountCmdRun(options)
	}
}

func addaccountCmdRun(options inputs) { // {{{1
	if *options.accountSeed == "" { // {{{2
		addSourceAccount()
		return
	}

	pair, _ := keypair.Parse(*options.accountSeed) // seed of the source account {{{2
	client := horizonclient.DefaultTestNetClient

	// Get information about the source account {{{2
	accountRequest := horizonclient.AccountRequest{AccountID: pair.Address()}
	hSourceAccount, err := client.AccountDetail(accountRequest)
	if err != nil {
		log.Fatal(err)
	}

	// Generate a new randomly generated address {{{2
	kp, err := keypair.Random()
	if err != nil {
		log.Fatal(err)
	}

	// Construct the operation {{{2
	createAccountOp := txnbuild.CreateAccount{
		Destination: kp.Address(),
		Amount:      *options.amount,
	}

	// Construct the transaction that will carry the operation {{{2
	tx := txnbuild.Transaction{
		SourceAccount: &hSourceAccount,
		Operations:    []txnbuild.Operation{&createAccountOp},
		Timebounds:    txnbuild.NewTimeout(300),
		Network:       network.TestNetworkPassphrase,
	}

	// Sign the transaction, serialise it to XDR, and base 64 encode it {{{2
	txeBase64, err := tx.BuildSignEncode(pair.(*keypair.Full))
	check(err)

	// Submit the transaction {{{2
	submit(txeBase64, client) // }}}2
	getInfo("- new account added:", kp, client)
}

func addSourceAccount() { // {{{1
	// Generate a new randomly generated address {{{2
	pair, err := keypair.Random()
	if err != nil {
		log.Fatal(err)
	}

	// Create and fund the address on TestNet, using friendbot {{{2
	client := horizonclient.DefaultTestNetClient
	client.Fund(pair.Address()) // }}}2
	getInfo("- new source account added:", pair, client)
}

func getInfo(title string, kp *keypair.Full, client *horizonclient.Client) { // {{{1
	fmt.Println(title)
	fmt.Println("     seed", kp.Seed())
	fmt.Println("  address", kp.Address())
	ar := horizonclient.AccountRequest{AccountID: kp.Address()}
	account, e := client.AccountDetail(ar)
	check(e)
	var amount string
	for _, b := range account.Balances {
		fmt.Println(b.Balance, b.Asset)
		amount = b.Balance
	}
	fmt.Println("   amount", amount, "XLM")
}

func submit(txeBase64 string, client *horizonclient.Client) { // {{{1
	_, e := client.SubmitTransactionXDR(txeBase64)
	if e != nil {
		hError := e.(*horizonclient.Error)
		log.Fatal("Error submitting transaction:", hError)
	}
}
