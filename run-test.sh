#!/bin/bash

set -x
set -e

TOPOLOGY=$1
TASK=$2
USER_NUMBER=$3

USER="user-$TOPOLOGY-$TASK-$USER_NUMBER"

sudo useradd $USER
sudo mkdir ~$USER
sudo chown $USER:$USER ~$USER
sudo chsh $USER -s /bin/bash

sudo -u $USER /local/repository/setup-my-user.sh
TOPOLOGY=$TOPOLOGY TASK=$TASK USER_NUMBER=$USER_NUMBER sudo -u $USER /local/repository/run-test-as-user.sh
