#!/bin/bash

inform "Installing dotfiles..."
git clone http://github.com/mjacobus/.dotfiles.git ~/.dotfiles
cd ~/.dotfiles && ./install.sh

exit_on_failure $?
