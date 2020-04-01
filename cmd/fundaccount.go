package cmd

import (
	"fmt"
	"log"

	"github.com/spf13/cobra"
	"github.com/stellar/go/clients/horizonclient"
)

var fundaccountCmd = &cobra.Command{
	Use:   "fundaccount",
	Short: "Funds a receiving account with an asset from the issuer",
	Long: `Funds a receiving account with an asset from the issuer.

Both the receiving account and the issuer are represented by their seeds.
The asset is represented by its name. The amount to fund is represented by
a number.

The account's seed is used to establish a trustline between the account and
the asset - the account must trust the asset. The issuer's seed is used to
send the specified amount of the asset to the receiving account.`,
	Example: `  conf fundaccount --asset COUPON --amount 10000 \
  --accountSeed GBMMZMK2DC4FFP4CAI6KCVNCQ7WLO5A7DQU7EC7WGHRDQBZB763X4OQI \
  --issuerSeed SANPCJHHXCPRN6IIZRBEQXS5M3L2LY7EYQLAVTYD56KL3V7ABO4I3ISZ`,
}

func init() {
	options := inputs{}
	options.asset = fundaccountCmd.Flags().StringP("asset", "", "", "(required) the name of the asset")
	fundaccountCmd.Flags().Float64Var(&options.amount, "amount", 0, "(required) the amount of the asset")
	options.accountSeed = fundaccountCmd.Flags().StringP("accountSeed", "", "", "(required) the seed of the receiving account")
	options.issuerSeed = fundaccountCmd.Flags().StringP("issuerSeed", "", "", "(required) the seed of the issuing account")
	requiredFlag("asset", fundaccountCmd)
	requiredFlag("amount", fundaccountCmd)
	requiredFlag("accountSeed", fundaccountCmd)
	requiredFlag("issuerSeed", fundaccountCmd)

	fundaccountCmd.Run = func(ccmd *cobra.Command, args []string) {
		fundaccountCmdRun(options)
	}
}

func fundaccountCmdRun(options inputs) {
	client := horizonclient.DefaultTestNetClient
	accountRequest := horizonclient.AccountRequest{AccountID: *options.address}
	hAccount, err := client.AccountDetail(accountRequest)
	if err != nil {
		log.Fatal(err)
	}
	fmt.Println(hAccount)
}
