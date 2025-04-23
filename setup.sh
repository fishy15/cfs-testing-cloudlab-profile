#!/bin/bash

set -x

# For setting up the repository on CloudLab
#
sudo apt update && sudo apt -y upgrade
sudo apt install -y git fakeroot build-essential ncurses-dev xz-utils libssl-dev bc flex libelf-dev bison qemu-system-x86 llvm

# install git-lfs and download image
cd /local/repository/

wget https://fishy15-vms-for-scheduler-logging.s3.us-west-1.amazonaws.com/d.q
