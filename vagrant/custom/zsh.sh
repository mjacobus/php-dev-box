#!/bin/bash

install zsh

inform "Installing oh-my-zsh..."
wget https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh -O - | zsh

exit_on_failure $?

inform "Setting shell to zshell..."
sudo chsh -s `which zsh`

exit_on_failure $?

inform "Login and logout again"
