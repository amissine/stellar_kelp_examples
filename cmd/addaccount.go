package cmd

import (
	"fmt"
	//"log"

	"github.com/spf13/cobra"
	"github.com/stellar/go/clients/horizonclient"
	//"github.com/stellar/go/keypair"
	//"github.com/stellar/go/network"
	//"github.com/stellar/go/txnbuild"
)

/*
  See also:
	- https://pkg.go.dev/github.com/stellar/go/clients/horizonclient?tab=doc
*/

var addaccountCmd = &cobra.Command{
	Use:   "addaccount",
	Short: "Adds new account, returns its address and seed",
	Long: `Adds new account, returns its address and seed. If the address flag 
is given, it specifies the source account that funds the new account. If the amount
flag is given, it specifies the amount of XLM to fund the new account. Otherwise,
the default amount is 500 XLM.

Without the address flag, a new source account gets created and funded by the
friendbot. If the amount flag is given, it is being ignored.`,
	Run: func(ccmd *cobra.Command, args []string) {
		addaccountCmdRun()
	},
	Example: `  conf addaccount
- new account added:
     seed GBMMZMK2DC4FFP4CAI6KCVNCQ7WLO5A7DQU7EC7WGHRDQBZB763X4OQI
  address GBMMZMK2DC4FFP4CAI6KCVNCQ7WLO5A7DQU7EC7WGHRDQBZB763X4OQI
   amount 10000 XLM
`,
}

func addaccountCmdRun() {
	client := horizonclient.DefaultTestNetClient
	fmt.Println(client)
}
