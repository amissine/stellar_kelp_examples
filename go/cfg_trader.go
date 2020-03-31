/* {{{1

  NOTE This code is based off of the following URL:
  - https://www.stellar.org/developers/go/reference/examples.html

	To compile it, I did this:

	mkdir vendor
	cp -a ../../stellar/kelp/vendor/ vendor/
*/
package main

import ( // {{{1
	"log"

	"github.com/stellar/go/clients/horizonclient"
	"github.com/stellar/go/keypair"
	"github.com/stellar/go/network"
	"github.com/stellar/go/txnbuild"
)

func main() { // {{{1
	// Generate a new randomly generated address {{{2
	pair, err := keypair.Random()
	if err != nil {
		log.Fatal(err)
	}
	log.Println("Seed 0:", pair.Seed())
	log.Println("Address 0:", pair.Address())

	// Create and fund the address on TestNet, using friendbot {{{2
	client := horizonclient.DefaultTestNetClient
	client.Fund(pair.Address())

	// Get information about the account we just created {{{2
	accountRequest := horizonclient.AccountRequest{AccountID: pair.Address()}
	hAccount0, err := client.AccountDetail(accountRequest)
	if err != nil {
		log.Fatal(err)
	}

	// Generate a second randomly generated address {{{2
	kp1, err := keypair.Random()
	if err != nil {
		log.Fatal(err)
	}
	log.Println("Seed 1:", kp1.Seed())
	log.Println("Address 1:", kp1.Address())

	// Construct the operation
	createAccountOp := txnbuild.CreateAccount{
		Destination: kp1.Address(),
		Amount:      "10",
	}

	// Construct the transaction that will carry the operation
	tx := txnbuild.Transaction{
		SourceAccount: &hAccount0,
		Operations:    []txnbuild.Operation{&createAccountOp},
		Timebounds:    txnbuild.NewTimeout(300),
		Network:       network.TestNetworkPassphrase,
	}

	// Sign the transaction, serialise it to XDR, and base 64 encode it
	txeBase64, err := tx.BuildSignEncode(pair)
	log.Println("Transaction base64: ", txeBase64)

	// Submit the transaction
	resp, err := client.SubmitTransactionXDR(txeBase64)
	if err != nil {
		hError := err.(*horizonclient.Error)
		log.Fatal("Error submitting transaction:", hError)
	}

	log.Println("\nTransaction response: ", resp)
}
