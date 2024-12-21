#!/bin/bash

set -x
set -e

GDB=$(bc <<<"2222 + $USER_NUMBER")
SSH=$(bc <<<"3333 + $USER_NUMBER")

TOPOLOGY=$TOPOLOGY GDB=$GDB SSH=$SSH runvm lfs &
sleep 10
ITERS=32 TOPOLOGY=$TOPOLOGY GDB=$GDB SSH=$SSH swk ~/out.json "$TASK"
