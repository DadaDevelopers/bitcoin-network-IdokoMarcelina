#!/bin/bash
# Connect the default regtest node (node1) to node2 which listens on 127.0.0.1:18445
set -e

bitcoin-cli -regtest addnode 127.0.0.1:18445 onetry
echo "Tried to connect to 127.0.0.1:18445"
# show peer info (you may need jq; or just show raw JSON)
bitcoin-cli -regtest getpeerinfo


