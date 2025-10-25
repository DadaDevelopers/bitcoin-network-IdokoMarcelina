#!/bin/bash
# Send 5 BTC from devwallet to a new address, show mempool, mine 1 block to include tx, and show confirmations.
set -e

# receiver address from default wallet (if using walletless default, you can specify -rpcwallet)
RECV_ADDR=$(bitcoin-cli -regtest -rpcwallet=devwallet getnewaddress)
echo "Receiving address: $RECV_ADDR"

# send 5 BTC
TXID=$(bitcoin-cli -regtest -rpcwallet=devwallet sendtoaddress "$RECV_ADDR" 5.0)
echo "Sent txid: $TXID"

# show mempool info and raw mempool
echo "Mempool info:"
bitcoin-cli -regtest getmempoolinfo
echo "Raw mempool:"
bitcoin-cli -regtest getrawmempool | jq '.'

# mine 1 block to confirm the tx (use the address we mined to before: get a mining address)
MINER_ADDR=$(bitcoin-cli -regtest -rpcwallet=devwallet getnewaddress)
bitcoin-cli -regtest -rpcwallet=devwallet generatetoaddress 1 "$MINER_ADDR"

echo "Mined 1 block to confirm transactions"
# verify tx confirmations
bitcoin-cli -regtest -rpcwallet=devwallet gettransaction "$TXID"

