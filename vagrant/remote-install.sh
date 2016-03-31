#!/bin/bash

sudo apt-get install -y git

rm -rf ~vagrant/repo

if [ ! -f ~vagrant/repo ]; then
  git clone https://github.com/mjacobus/php-dev-box ~vagrant/repo
fi

source ~vagrant/repo/vagrant/config.sh
source ~vagrant/repo/vagrant/bootstrap.sh
