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

RECIPES = buysell \
					default_recipe

.PHONY: $(RECIPES)

# Default recipe: buysell {{{1
default_recipe: buysell

# Run buysell example {{{1
buysell:
	@./buysell.sh
