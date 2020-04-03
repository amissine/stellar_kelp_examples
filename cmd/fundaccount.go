package cmd

import ( // {{{1
	"log"

	"github.com/spf13/cobra"
	"github.com/stellar/go/clients/horizonclient"
	"github.com/stellar/go/keypair"
	"github.com/stellar/go/network"
	"github.com/stellar/go/txnbuild"
)

var fundaccountCmd = &cobra.Command{ // {{{1
	Use:   "fundaccount",
	Short: "Funds a receiving account with an asset from the issuer",
	Long: `Funds a receiving account with an asset from the issuer.

Both the receiving account and the issuer are represented by their seeds.
The asset is represented by its name (the address of the issuer is derived from its
seed). The amount to fund, if present, is represented by a number. The default
amount is 10000.

The account's seed is used to establish a trustline between the account and
the asset - the account must trust the asset. The issuer's seed is used to
send the specified amount of the asset to the receiving account.`,
	Example: `  conf fundaccount --asset COUPON \
  --accountSeed SA6OPLUHQVKZXMHKSFT3NMOYZWRSYZGQLHEBPL4OYXE4UKDYPGK3XT77\
  --issuerSeed SANPCJHHXCPRN6IIZRBEQXS5M3L2LY7EYQLAVTYD56KL3V7ABO4I3ISZ`,
}

func init() { // {{{1
	options := inputs{}
	options.asset = fundaccountCmd.Flags().StringP("asset", "", "", "(required) the name of the asset")
	options.amount = fundaccountCmd.Flags().StringP("amount", "", "10000", "the amount of the asset")
	options.accountSeed = fundaccountCmd.Flags().StringP("accountSeed", "", "", "(required) the seed of the receiving account")
	options.issuerSeed = fundaccountCmd.Flags().StringP("issuerSeed", "", "", "(required) the seed of the issuing account")
	requiredFlag("asset", fundaccountCmd)
	requiredFlag("accountSeed", fundaccountCmd)
	requiredFlag("issuerSeed", fundaccountCmd)

	fundaccountCmd.Run = func(ccmd *cobra.Command, args []string) {
		fundaccountCmdRun(options)
	}
}

func check(e error) {
	if e != nil {
		log.Fatal(e)
	}
}

func fundaccountCmdRun(options inputs) { // {{{1
	a2f, _ := keypair.Parse(*options.accountSeed) // seed of the account to fund {{{2
	ia, _ := keypair.Parse(*options.issuerSeed)   // seed of the issuing account
	client := horizonclient.DefaultTestNetClient
	accountRequest := horizonclient.AccountRequest{AccountID: a2f.Address()}
	account2fund, e := client.AccountDetail(accountRequest)
	check(e)

	op := txnbuild.ChangeTrust{ // create trustline to asset {{{2
		Line:  txnbuild.CreditAsset{*options.asset, ia.Address()},
		Limit: "30000", // FIXME
	}
	tx := txnbuild.Transaction{
		SourceAccount: &account2fund,
		Operations:    []txnbuild.Operation{&op},
		Timebounds:    txnbuild.NewTimeout(30),
		Network:       network.TestNetworkPassphrase,
	}
	txe, e := tx.BuildSignEncode(a2f.(*keypair.Full))
	check(e)
	submit(txe, client)

	// Have the issuer fund the receiving account {{{2
	accountRequest = horizonclient.AccountRequest{AccountID: ia.Address()}
	issuer, e := client.AccountDetail(accountRequest)
	check(e)
	fund := txnbuild.Payment{
		Destination: a2f.Address(),
		Asset:       txnbuild.CreditAsset{*options.asset, ia.Address()},
		Amount:      *options.amount,
	}
	tx = txnbuild.Transaction{
		SourceAccount: &issuer,
		Operations:    []txnbuild.Operation{&fund},
		Timebounds:    txnbuild.NewTimeout(30),
		Network:       network.TestNetworkPassphrase,
	}
	txe, e = tx.BuildSignEncode(ia.(*keypair.Full))
	check(e)
	submit(txe, client) // }}}2
	getInfo("- receiving account funded:", a2f.(*keypair.Full), client)
}
