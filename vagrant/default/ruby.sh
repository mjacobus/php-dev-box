#!/bin/bash

if [ ! -f $HOME/.rvm/scripts/rvm ]; then
  as_vagrant 'gpg --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3 && curl -sSL https://get.rvm.io | bash -s stable --ruby'

  inform "Setting up rvm loader ..."
  RVM_LOADER='[[ -f ~/.rvm/scripts/rvm ]] && source ~/.rvm/scripts/rvm'
  as_vagrant "echo '$RVM_LOADER'> ~vagrant/.rvm_loader"

  as_vagrant_append_if_not_exists 'source ~/.rvm_loader' ~vagrant/.bashrc
  as_vagrant_append_if_not_exists 'source ~/.rvm_loader' ~vagrant/.bash_profile
  as_vagrant 'gem install bundler'
fi
