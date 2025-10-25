#!/usr/bin/env python3
# merkle-verify.py
# Usage: python3 merkle-verify.py TXID1 TXID2
import sys
import hashlib

def double_sha256(b):
    return hashlib.sha256(hashlib.sha256(b).digest()).digest()

if len(sys.argv) < 3:
    print("Usage: python3 merkle-verify.py <txid1> <txid2>")
    sys.exit(1)

txid1 = sys.argv[1]
txid2 = sys.argv[2]

# convert hex txid (big-endian) to little-endian bytes for merkle calc
a = bytes.fromhex(txid1)[::-1]
b = bytes.fromhex(txid2)[::-1]

root = double_sha256(a + b)[::-1].hex()
print("Merkle root:", root)

