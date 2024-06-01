#!/bin/bash

# For setting up the repository on CloudLab
#
sudo apt update && sudo apt -y upgrade
sudo apt install -y git fakeroot build-essential ncurses-dev xz-utils libssl-dev bc flex libelf-dev bison

cd /local/

# create workspace
mkdir research/
cd research/

git clone https://github.com/fishy15/linux-cfs-testing --depth=1 kernel/

mkdir build/
cd build/
cp ../kernel/myconfig .config

# move config files
cp /local/repository/build-kernel /local/research/
cp /local/repository/runvm /local/research/


