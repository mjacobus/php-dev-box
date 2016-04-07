#!/bin/bash

source ~vagrant/repo/vagrant/config.sh

inform "Testing installation:"

as_vagrant_check 'nginx installation' 'curl -I localhost | grep "Server: nginx/1.8"'
as_vagrant_check 'php installation'   'php --version | grep "5.6"'
as_vagrant_check 'ruby installation'  'ruby --version | grep "ruby 2.3"'
as_vagrant_check 'npm installation'   'npm --version | grep "^2\."'
