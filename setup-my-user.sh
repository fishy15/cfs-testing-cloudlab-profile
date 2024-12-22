#!/bin/bash

set -x
set -e

SCRIPTS="$HOME/rsch/kernel/logging-scripts"

# create workspace
mkdir -p ~/rsch/
cd ~/rsch/

git clone https://github.com/fishy15/linux-cfs-testing --depth=1 -b logging kernel/

touch ~/.bashrc
echo 'export PATH=$PATH:~/rsch/kernel/logging-scripts' >> ~/.bashrc
source ~/.bashrc

mkdir kbuild/
cd kbuild/
cp ../kernel/myconfig .config

"$SCRIPTS/build-kernel"

# move config files
cp /local/repository/lfs ~/rsch/lfs

cp /local/repository/d.q "$HOME/rsch/d.q"

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
echo "add-auto-load-safe-path ~/rsch/kernel/scripts/gdb/vmlinux-gdb.py" >> "$CONFIG/gdb/gdbinit"

gcc "$SCRIPTS/swk.c" -o "$SCRIPTS/swk"

# add private key to log onto d.q
private_key=$(cat <<EOF
-----BEGIN OPENSSH PRIVATE KEY-----
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
5jbG91ZGxhYi51cwECAwQFBgc=
-----END OPENSSH PRIVATE KEY-----
EOF
)
mkdir -p ~/.ssh
echo "$private_key" >> ~/.ssh/id_rsa
chmod 600 ~/.ssh/id_rsa
