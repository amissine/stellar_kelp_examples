package cmd

import (
	"fmt"

	"github.com/spf13/cobra"
	"github.com/stellar/go/clients/horizonclient"
)

var getinfoCmd = &cobra.Command{
	Use:     "getinfo",
	Short:   "Gets info about account specified by its address",
	Example: "  conf getinfo --address GBMMZMK2DC4FFP4CAI6KCVNCQ7WLO5A7DQU7EC7WGHRDQBZB763X4OQI",
}

type inputs struct {
	accountSeed *string
	address     *string
	amount      *string
	asset       *string
	issuerSeed  *string
}

func init() {
	options := inputs{}
	options.address = getinfoCmd.Flags().StringP("address", "a", "", "(required) account's public key")
	requiredFlag("address", getinfoCmd)

	getinfoCmd.Run = func(ccmd *cobra.Command, args []string) {
		getinfoCmdRun(options)
	}
}

func requiredFlag(flag string, ccmd *cobra.Command) {
	e := ccmd.MarkFlagRequired(flag)
	check(e)
}

func getinfoCmdRun(options inputs) {
	client := horizonclient.DefaultTestNetClient
	accountRequest := horizonclient.AccountRequest{AccountID: *options.address}
	hAccount, err := client.AccountDetail(accountRequest)
	check(err)
	for _, b := range hAccount.Balances {
		fmt.Println(b.Balance, b.Asset)
	}
}
