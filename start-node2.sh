#!/bin/bash
# Start a second regtest node in ~/bitcoin-node2 on different ports
set -e
DATADIR="$HOME/bitcoin-node2"
mkdir -p "$DATADIR"

# start second node on custom ports (p2p port 18445, rpc 18446)
bitcoind -regtest -datadir="$DATADIR" -port=18445 -rpcport=18446 -daemon

echo "Started node2 with datadir $DATADIR on port 18445 and rpcport 18446"


