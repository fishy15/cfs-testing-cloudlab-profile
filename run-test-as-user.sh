#!/bin/bash

set -x
set -e

TOPOLOGY=$1
TASK=$2
USER_NUMBER=$3

SCRIPTS="$HOME/linux/"

SSH=$(bc <<<"3333 + $USER_NUMBER")

# f=$(mktemp)
# rm -f $f
# touch $f
K=1 TOPOLOGY=$TOPOLOGY SSH=$SSH "$SCRIPTS/run.sh" &
#grep "localhost login:" $f | tail -n1
# tail -f $f | grep "localhost login:" | head -n1
# echo "grep exited, running swk"

sleep 30

# swk will store out.json under $HOME
TOPOLOGY=$TOPOLOGY SSH=$SSH $SCRIPTS/swk out.json "$TASK"

pkill qemu # kill qemu in the background
