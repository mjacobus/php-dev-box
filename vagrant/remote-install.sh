#!/bin/bash

sudo apt-get install -y git

rm -rf ~vagrant/repo
git clone https://github.com/ggs-pages/php-dev-box ~vagrant/repo

source ~vagrant/repo/vagrant/config.sh
source ~vagrant/repo/vagrant/bootstrap.sh
