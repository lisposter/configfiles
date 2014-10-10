#!/bin/sh

## This script is for my private staff.
## Such as, ssh-key, ssh-config, hosts file, etc. 
## All of these files are not in this repo.

SRC=$HOME/Dropbox/Dev/
WORKPATH=$HOME/Work/

# copy hosts
sudo cp -f ${SRC}hosts /etc/hosts

# copy ssh config
sudo cp -rf ${SRC}ssh/ ~/.ssh/

# copy nginx config for vagrant box
cp -rf ${SRC}sites-enabled/ ${WORKPATH}conf