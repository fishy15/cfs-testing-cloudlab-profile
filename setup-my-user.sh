#!/bin/bash

set -x
set -e

# create workspace
mkdir ~/rsch/
cd ~/rsch/

git clone https://github.com/fishy15/linux-cfs-testing --depth=1 -b logging kernel/

echo 'export PATH=$PATH:~/rsch/kernel/logging-scripts' >> ~./bashrc
source ~/.bashrc

mkdir kbuild/
cd kbuild/
cp ../kernel/myconfig .config

build-kernel

# move config files
cp /local/repository/lfs ~/rsch/lfs

for i in `seq 1 $1`; do
    cp /local/repository/d.q "$HOME/rsch/d-$i.q"
done

ln -s /local/repository/d.q ~aprakas/rsch/d.q

# set up qemu
# sudo apt install -y meson ninja-build libglib2.0-dev libslirp-dev flex bison python3-pip python3-venv
# pip install tomli
# cd /local/research
# git clone https://gitlab.com/qemu-project/qemu.git
# mkdir -p qemu/build
# cd qemu/build
# sudo ../configure --enable-slirp && sudo make -j`nproc`
# sudo ln -s /local/research/qemu/build/qemu-system-x86_64 /local/research/bin/qxd

# set up gdbinit
CONFIG="$HOME/.config"
mkdir -p "$CONFIG"
mkdir -p "$CONFIG/gdb"
touch "$CONFIG/gdb/gdbinit"
echo "add-auto-load-safe-path /local/research/kernel/scripts/gdb/vmlinux-gdb.py" | sudo tee -a "$CONFIG/gdb/gdbinit"

cd ~/rsch/kernel/logging-scripts
gcc swk.c -o swk
