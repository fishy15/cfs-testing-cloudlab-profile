#!/bin/bash

set -x
set -e

TOPOLOGY=$1
TASK=$2
USER_NUMBER=$3

SCRIPTS="$HOME/rsch/kernel/logging-scripts"

GDB=$(bc <<<"2222 + $USER_NUMBER")
SSH=$(bc <<<"3333 + $USER_NUMBER")

# f=$(mktemp)
# rm -f $f
# touch $f
TOPOLOGY=$TOPOLOGY GDB=$GDB SSH=$SSH "$SCRIPTS/runvm" d.q &
#grep "localhost login:" $f | tail -n1
# tail -f $f | grep "localhost login:" | head -n1
# echo "grep exited, running swk"

sleep 30

# swk will store out.json under $HOME
ITERS=32 TOPOLOGY=$TOPOLOGY GDB=$GDB SSH=$SSH $SCRIPTS/swk out.json "$TASK"
