#!/bin/bash

source ~vagrant/repo/vagrant/config.sh

inform "Updating index..."
sudo apt-get update -y

install build-essential
install cmake
install python-dev

source install_default.sh
source test.sh

exit 0
