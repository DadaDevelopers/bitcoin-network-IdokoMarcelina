#!/bin/bash
# Tail the regtest debug.log and filter for compact messages
# Location: ~/.bitcoin/regtest/debug.log
LOG="$HOME/.bitcoin/regtest/debug.log"
echo "Tailing $LOG for compact and cmpct messages (press Ctrl+C to stop)"
tail -f "$LOG" | grep --line-buffered -E "compact|cmpct|sendcmpct|cmpctblock"

