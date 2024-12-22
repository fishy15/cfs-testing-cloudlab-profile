#!/bin/bash

set -x
set -e

TOPOLOGY=$1
TASK=$2
USER_NUMBER=$3

SCRIPTS="$HOME/rsch/kernel/logging-scripts"

GDB=$(bc <<<"2222 + $USER_NUMBER")
SSH=$(bc <<<"3333 + $USER_NUMBER")

f=$(mktemp)
rm -f $f
TOPOLOGY=$TOPOLOGY GDB=$GDB SSH=$SSH "$SCRIPTS/runvm" d.q >$f &
#grep "localhost login:" $f | tail -n1
grep "Debian GNU/Linux 12 localhost ttyS0" $f | tail -n1

# swk will store out.json under $HOME
ITERS=1 TOPOLOGY=$TOPOLOGY GDB=$GDB SSH=$SSH "$SCRIPTS/swk" out.json "$TASK"
