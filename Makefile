# vim :set foldmethod=marker {{{1
#
# Legal stuff {{{1
#
# Copyright 2020 Alec Missine (alec_missine@yahoo.com)
#                and the Arbitrage Logistics International (ALI) project
#
# The ALI Project licenses this file to you under the Apache License, version 2.0
# (the "License"); you may not use this file except in compliance with the License.
# You may obtain a copy of the License at:
#
#   http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software distributed
# under the License is distributed on an "AS IS" BASIS, WITHOUT WARRANTIES OR
# CONDITIONS OF ANY KIND, either express or implied. See the License for the
# specific language governing permissions and limitations under the License.
#
# Run stellar/kelp examples. {{{1
# See also:
# - https://medium.com/stellar-developers-blog/kelp-why-we-built-it-the-liquidity-problem-425ca5558c1d

# Check if 'make' runs from the directory where this Makefile resides. {{{1
$(if $(findstring /,$(MAKEFILE_LIST)),$(error Please only invoke this Makefile from the directory it resides in))

# Run all shell commands with bash. {{{1
SHELL := bash

# Locals {{{1

RECIPES = buysell reset \
					default_recipe

.PHONY: $(RECIPES)

CONF := bin/stellar_kelp_examples
COMMANDS := cmd/root.go cmd/addaccount.go cmd/fundaccount.go cmd/getinfo.go
ISSUER_SEED := SANPCJHHXCPRN6IIZRBEQXS5M3L2LY7EYQLAVTYD56KL3V7ABO4I3ISZ

# Default recipe: buysell {{{1
default_recipe: buysell

# Run buysell example {{{1
buysell: cfg/buysell.cfg cfg/trader.cfg
	@kelp trade --botConf ./cfg/trader.cfg --strategy buysell --stratConf ./cfg/buysell.cfg

cfg/buysell.cfg:
	cp $@.src $@

cfg/trader.cfg: add_trader_account.run fund_source_account.run
	@./cfg_trader.sh

add_trader_account.run: add_source_account.run
	@echo "export SOURCE_ACCOUNT_SEED=$$(cat add_source_account.run | grep seed | awk '{print $$2}')" > e; \
	. e; rm e; \
	./conf addaccount --accountSeed "$$SOURCE_ACCOUNT_SEED" > $@

add_source_account.run: $(CONF)
	./conf addaccount > $@

$(CONF): vendor main.go $(COMMANDS)
	go build -o bin/

fund_source_account.run: add_source_account.run
	@echo "export SOURCE_ACCOUNT_SEED=$$(cat add_source_account.run | grep seed | awk '{print $$2}')" > e; \
	. e; rm e; \
	./conf fundaccount --issuerSeed $(ISSUER_SEED) --accountSeed "$$SOURCE_ACCOUNT_SEED" --asset COUPON > $@

reset:
	touch add_source_account.run; sleep 1; \
	touch add_trader_account.run; sleep 1; \
	touch fund_source_account.run; touch vendor/

vendor: vendor.zip # create vendor.zip with 'zip -qr vendor vendor'
	@echo vendor is older, unzip $<
