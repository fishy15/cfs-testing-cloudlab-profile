#!/bin/bash

set -x
set -e

TOPOLOGY=$1
TASK=$2
USER_NUMBER=$3

USER="user-$USER_NUMBER"
USERH="/mydata/$USER"

if id "$USER" >/dev/null 2>&1; then
	sudo rm -rf $USERH
	sudo mkdir -p $USERH
	sudo chown $USER:$USER $USERH
else
	sudo mkdir -p $USERH
	sudo useradd $USER
	sudo usermod -d $USERH $USER
	sudo chown $USER:$USER $USERH
	sudo chsh $USER -s /bin/bash
	echo "$USER ALL = NOPASSWD : ALL" | sudo EDITOR='tee -a' visudo
fi

sudo -Hiu $USER /local/repository/setup-my-user.sh
sudo -Hiu $USER /local/repository/run-test-as-user.sh "$TOPOLOGY" "$TASK" "$USER_NUMBER"
