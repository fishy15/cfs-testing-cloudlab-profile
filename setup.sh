#!/bin/bash

# For setting up the repository on CloudLab
#
sudo apt update && sudo apt -y upgrade
sudo apt install -y git fakeroot build-essential ncurses-dev xz-utils libssl-dev bc flex libelf-dev bison qemu-system-x86 git-lfs

cd /local/

# install git-lfs and download image
cd repository/
git lfs install
git lfs pull
cd ..

# create workspace
mkdir research/
cd research/

git clone https://github.com/fishy15/linux-cfs-testing --depth=1 kernel/

mkdir build/
cd build/
cp ../kernel/myconfig .config

# move config files
cp -r /local/repository/bin /local/research
cp /local/repository/lfs /local/research

# set up qemu
sudo apt install meson ninja-build libglib2.0-dev libslirp-dev flex bison python3-pip python3-venv
pip install tomli
cd /local/research
mkdir -p qemu/build
cd qemu/build
../configure --enable-slirp && make -j`nproc`
ln -s /local/research/qemu/build/qemu-system-x86_64 /local/research/bin/qxd

# add bin to PATH
echo 'export PATH="$PATH:/local/research/bin"' >> ~/.bashrc
