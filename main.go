package main

import (
	"log"

	"github.com/amissine/stellar_kelp_examples/cmd"
)

func main() {
	e := cmd.RootCmd.Execute()
	if e != nil {
		log.Fatal(e)
	}
}
