#!/bin/bash
set -e
echo "Stopping default node..."
bitcoin-cli -regtest stop || true
sleep 1

echo "Stopping node2..."
bitcoin-cli -datadir="$HOME/bitcoin-node2" -regtest stop || true
sleep 1

echo "Stopping filter node..."
bitcoin-cli -datadir="$HOME/bitcoin-node-filter" -regtest stop || true
sleep 1

echo "Done. You may remove datadirs manually if desired:"
echo "rm -rf ~/bitcoin-node2 ~/.bitcoin/regtest ~/bitcoin-node-filter"

