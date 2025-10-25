#!/bin/bash
# Create wallet and mine 101 blocks to a new address
set -e

# create wallet named devwallet (if exists, it'll return error which we ignore)
bitcoin-cli -regtest createwallet devwallet || true

# get a new address from devwallet
ADDRESS=$(bitcoin-cli -regtest -rpcwallet=devwallet getnewaddress)
echo "New address: $ADDRESS"

# mine 101 blocks to that address (creates spendable coins)
bitcoin-cli -regtest -rpcwallet=devwallet generatetoaddress 101 "$ADDRESS"

echo "Mined 101 blocks to $ADDRESS"
bitcoin-cli -regtest getblockchaininfo


