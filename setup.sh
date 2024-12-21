#!/bin/bash

set -x

# For setting up the repository on CloudLab
#
sudo apt update && sudo apt -y upgrade
sudo apt install -y git fakeroot build-essential ncurses-dev xz-utils libssl-dev bc flex libelf-dev bison qemu-system-x86 git-lfs

cd /local/

# install git-lfs and download image
cd repository/
git lfs install
git lfs pull

# install aws cli
curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
unzip awscliv2.zip
sudo ./aws/install

aws configure set aws_access_key_id AKIAXHHN5W6YCKRKI77C
aws configure set aws_secret_access_key 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
aws configure set region us-west-1

aws s3 cp s3://fishy15-vms-for-scheduler-logging/d.q d.q
