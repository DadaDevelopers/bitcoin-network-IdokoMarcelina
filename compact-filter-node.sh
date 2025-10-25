#!/bin/bash
# Start a node with block filter index enabled (BIP157/158 support)
set -e
DATADIR="$HOME/bitcoin-node-filter"
mkdir -p "$DATADIR"

bitcoind -regtest -datadir="$DATADIR" -blockfilterindex=1 -daemon
echo "Started node with blockfilterindex=1 and datadir $DATADIR"

