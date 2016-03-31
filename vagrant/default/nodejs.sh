#!/bin/bash

if ! has node; then
  as_vagrant "curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.31.0/install.sh | bash"
  NVM_LOADER='[[ -f ~/.nvm/nvm.sh ]] && source ~/.nvm/nvm.sh'
  as_vagrant "echo '$NVM_LOADER'> ~vagrant/.nvm_loader"

  as_vagrant "nvm install v0.12"
  as_vagrant "npm install grunt-cli -g"
fi
