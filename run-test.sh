#!/bin/bash

set -x
set -e

TOPOLOGY=$1
TASK=$2
USER_NUMBER=$3

USER="user-$USER_NUMBER"
USERH="/mydata/$USER"

sudo mkdir -p $USERH

sudo useradd $USER
sudo usermod -d $USERH $USER
sudo chown $USER:$USER $USERH
sudo chsh $USER -s /bin/bash

sudo -Hiu $USER /local/repository/setup-my-user.sh
sudo -Hiu $USER /local/repository/run-test-as-user.sh "$TOPOLOGY" "$TASK" "$USER_NUMBER"
