#!/bin/bash
# Start the primary bitcoind node in regtest
# Data dir: default (~/.bitcoin/regtest)
bitcoind -regtest -daemon
echo "Started bitcoind (node1) in regtest using default datadir (~/.bitcoin/regtest)."

