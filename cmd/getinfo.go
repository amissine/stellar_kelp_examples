package cmd

import (
	"fmt"
	"github.com/spf13/cobra"
)

var getinfoCmd = &cobra.Command{
	Use:     "getinfo",
	Short:   "Gets info about specified object",
	Example: "  conf getinfo --address GBMMZMK2DC4FFP4CAI6KCVNCQ7WLO5A7DQU7EC7WGHRDQBZB763X4OQI",
}

type inputs struct {
	address *string
}

func init() {
	options := inputs{}
	options.address = getinfoCmd.Flags().StringP("address", "a", "", "(required) account's public key")
	requiredFlag("address")

	getinfoCmd.Run = func(ccmd *cobra.Command, args []string) {
		getinfoCmdRun(options)
	}
}

func requiredFlag(flag string) {
	e := getinfoCmd.MarkFlagRequired(flag)
	if e != nil {
		panic(e)
	}
}

func getinfoCmdRun(options inputs) {
	fmt.Println(*options.address)
}
