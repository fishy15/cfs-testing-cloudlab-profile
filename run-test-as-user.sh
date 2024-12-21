#!/bin/bash

set -x
set -e

TOPOLOGY=$1
TASK=$2
USER_NUMBER=$3

SCRIPTS="$HOME/rsch/kernel/logging-scripts"

GDB=$(bc <<<"2222 + $USER_NUMBER")
SSH=$(bc <<<"3333 + $USER_NUMBER")

TOPOLOGY=$TOPOLOGY GDB=$GDB SSH=$SSH "$SCRIPTS/runvm" lfs &
sleep 15
ITERS=1 TOPOLOGY=$TOPOLOGY GDB=$GDB SSH=$SSH "$SCRIPTS/swk" ~/out.json "$TASK"
