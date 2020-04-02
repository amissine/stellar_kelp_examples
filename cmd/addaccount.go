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
- new account added:
     seed GBMMZMK2DC4FFP4CAI6KCVNCQ7WLO5A7DQU7EC7WGHRDQBZB763X4OQI
  address GBMMZMK2DC4FFP4CAI6KCVNCQ7WLO5A7DQU7EC7WGHRDQBZB763X4OQI
   amount 10000 XLM
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
	if *options.accountSeed == "" {
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
	if err != nil {
		log.Fatal(err)
	}

	// Submit the transaction {{{2
	_, err = client.SubmitTransactionXDR(txeBase64)
	if err != nil {
		hError := err.(*horizonclient.Error)
		log.Fatal("Error submitting transaction:", hError)
	}

	fmt.Println("- new account added:") // {{{2
	fmt.Println("     seed", kp.Seed())
	fmt.Println("  address", kp.Address())
	accountRequest = horizonclient.AccountRequest{AccountID: kp.Address()}
	hAccount, err := client.AccountDetail(accountRequest)
	if err != nil {
		log.Fatal(err)
	}
	var amount string
	for _, b := range hAccount.Balances {
		fmt.Println(b.Balance, b.Asset)
		amount = b.Balance
	}
	fmt.Println("   amount", amount, "XLM") // }}}2
}

func addSourceAccount() { // {{{1
	// Generate a new randomly generated address {{{2
	pair, err := keypair.Random()
	if err != nil {
		log.Fatal(err)
	}

	// Create and fund the address on TestNet, using friendbot {{{2
	client := horizonclient.DefaultTestNetClient
	client.Fund(pair.Address())

	// Get information about the account we just created {{{2
	accountRequest := horizonclient.AccountRequest{AccountID: pair.Address()}
	hAccount, err := client.AccountDetail(accountRequest)
	if err != nil {
		log.Fatal(err)
	}
	fmt.Println("- new account added:")
	fmt.Println("     seed", pair.Seed())
	fmt.Println("  address", pair.Address())
	var amount string
	for _, b := range hAccount.Balances {
		fmt.Println(b.Balance, b.Asset)
		amount = b.Balance
	}
	fmt.Println("   amount", amount, "XLM") // }}}2
}
