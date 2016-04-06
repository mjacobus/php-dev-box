#!/bin/bash

RVM_LOADER='[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"'

# add customizations to shellrc
as_vagrant 'touch ~/.shellrc'
as_vagrant_append_if_not_exists '[[ -s "$HOME/.rvm_loader" ]] && source ~/.rvm_loader' ~vagrant/.shellrc
as_vagrant_append_if_not_exists '[[ -s "$HOME/.nvm_loader" ]] && source ~/.nvm_loader' ~vagrant/.shellrc
as_vagrant_append_if_not_exists '[[ -s "$HOME/.aliases" ]] && source ~/.aliases' ~vagrant/.shellrc
as_vagrant_append_if_not_exists 'cd /vagrant' ~vagrant/.shellrc
as_vagrant_append_if_not_exists 'PS1="\[\033[35m\]\t\[\033[m\]-\[\033[36m\]\u\[\033[m\]@\[\033[32m\]\h:\[\033[33;1m\]\w\[\033[m\]\$ "'  ~vagrant/.shellrc

# load configs
as_vagrant 'touch ~/.zshrc.local'
as_vagrant 'touch ~/.bashrc.local'

as_vagrant_append_if_not_exists '[[ -s "$HOME/.shellrc" ]] && source ~/.shellrc' ~vagrant/.bashrc.local
as_vagrant_append_if_not_exists '[[ -s "$HOME/.shellrc" ]] && source ~/.shellrc' ~vagrant/.zshrc.local
as_vagrant_append_if_not_exists '[[ -s "$HOME/.shellrc" ]] && source ~/.shellrc' ~vagrant/.bash_profile

# aliases
as_vagrant 'touch ~/.aliases'
as_vagrant_append_if_not_exists 'alias phpunit="./vendor/bin/phpunit"' ~vagrant/.aliases
as_vagrant_append_if_not_exists 'alias t=phpunit' ~vagrant/.aliases
as_vagrant_append_if_not_exists 'alias ls="ls --color"'  ~vagrant/.aliases
as_vagrant_append_if_not_exists 'alias gs="git status -s"'  ~vagrant/.aliases
as_vagrant_append_if_not_exists 'alias gc="git commit"'  ~vagrant/.aliases
as_vagrant_append_if_not_exists 'alias gl="git log"'  ~vagrant/.aliases
as_vagrant_append_if_not_exists 'alias gco="git checkout"'  ~vagrant/.aliases
