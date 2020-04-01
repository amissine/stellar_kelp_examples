package cmd

import (
	"github.com/spf13/cobra"
)

var RootCmd = &cobra.Command{
	Use:   "conf",
	Short: "Configures kelp examples.",
	Long: `Configures kelp examples.
Finished: none, work-in-progress: buysell.`,
	Run: func(ccmd *cobra.Command, args []string) {
		e := ccmd.Help()
		if e != nil {
			panic(e)
		}
	},
}

func init() {
	RootCmd.AddCommand(addaccountCmd)
	RootCmd.AddCommand(fundaccountCmd)
	RootCmd.AddCommand(getinfoCmd)
}
