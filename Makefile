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

RECIPES = buysell reset terminate \
					default_recipe

.PHONY: $(RECIPES)

CONF := bin/stellar_kelp_examples
COMMANDS := cmd/root.go cmd/addaccount.go cmd/fundaccount.go cmd/getinfo.go
ISSUER_SEED := SANPCJHHXCPRN6IIZRBEQXS5M3L2LY7EYQLAVTYD56KL3V7ABO4I3ISZ

# Default recipe: buysell {{{1
default_recipe: buysell

# Run buysell example {{{1
buysell: cfg/buysell.cfg cfg/trader.cfg
	@kelp trade --botConf cfg/trader.cfg --strategy buysell --stratConf cfg/buysell.cfg

# Update cfg/buysell.cfg {{{1
cfg/buysell.cfg: cfg/buysell.cfg.src
	@cp $< $@; echo '- $@ updated'

# Update cfg/trader.cfg {{{1
cfg/trader.cfg: cfg/trader.cfg.src add_trader_account.run fund_trader_account.run
	@echo "export TRADER_PUBLIC_KEY=$$(cat add_trader_account.run | grep address | awk '{print $$2}')" > e; \
	echo "export TRADER_SECRET_SEED=$$(cat add_trader_account.run | grep seed | awk '{print $$2}')" >> e; \
	echo "export SOURCE_PUBLIC_KEY=$$(cat add_source_account.run | grep address | awk '{print $$2}')" >> e; \
	echo "export SOURCE_SECRET_SEED=$$(cat add_source_account.run | grep seed | awk '{print $$2}')" >> e; \
	. e; rm e; \
	sed "s/{TRADER_PUBLIC_KEY}/$${TRADER_PUBLIC_KEY}/g" <$< | \
	sed "s/{TRADER_SECRET_SEED}/$${TRADER_SECRET_SEED}/g" | \
	sed "s/{SOURCE_PUBLIC_KEY}/$${SOURCE_PUBLIC_KEY}/g" | \
	sed "s/{SOURCE_SECRET_SEED}/$${SOURCE_SECRET_SEED}/g" >$@; echo '- $@ updated'

# Add trader account {{{1
add_trader_account.run: add_source_account.run
	@echo "export SOURCE_ACCOUNT_SEED=$$(cat add_source_account.run | grep seed | awk '{print $$2}')" > e; \
	. e; rm e; \
	$(CONF) addaccount --accountSeed "$$SOURCE_ACCOUNT_SEED" > $@

# Fund trader account {{{1
fund_trader_account.run: add_trader_account.run
	@echo "export ACCOUNT_SEED=$$(cat add_trader_account.run | grep seed | awk '{print $$2}')" > e; \
	. e; rm e; \
	$(CONF) fundaccount --issuerSeed $(ISSUER_SEED) --accountSeed "$$ACCOUNT_SEED" --asset COUPON > $@

# Add source account {{{1
add_source_account.run: $(CONF)
	$(CONF) addaccount > $@

$(CONF): main.go $(COMMANDS)
	go build -o $@

# Terminate offers across all inactive bots {{{1
terminate: cfg/terminator.cfg
	@kelp $@ --conf $<

# Update cfg/terminator.cfg {{{1
cfg/terminator.cfg: add_trader_account.run add_source_account.run
	@echo "export TRADER_SECRET_SEED=$$(cat add_trader_account.run | grep seed | awk '{print $$2}')" > e; \
	echo "export SOURCE_SECRET_SEED=$$(cat add_source_account.run | grep seed | awk '{print $$2}')" >> e; \
	. e; rm e; \
	sed "s/{TRADER_SECRET_SEED}/$${TRADER_SECRET_SEED}/g" <cfg/terminator.cfg.src | \
	sed "s/{SOURCE_SECRET_SEED}/$${SOURCE_SECRET_SEED}/g" >cfg/terminator.cfg

# Other unreferenced recipes/files/dirs {{{1
reset:
	touch add_source_account.run add_trader_account.run vendor

vendor: vendor.zip # create vendor.zip with 'zip -qr vendor vendor'
	@unzip vendor.zip
