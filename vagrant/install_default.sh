#!/bin/bash

export VAGRANT_REPO=/home/vagrant/repo
source $VAGRANT_REPO/vagrant/config.sh

source $VAGRANT_SCRIPTS/functions.sh

if (($# == 0)); then
  # installs all the default files
  for file in `ls default | grep .sh | grep -v check.sh`; do
    source "default/$file"
  done

  if [[ -s "/vagrant/vagrant/vagrant_after_install.sh" ]]; then
    inform "loading custom after_install"
    source /vagrant/vagrant/vagrant_after_install.sh
  else
    inform "No custom after_install found"
  fi

  exit 0
fi

for file in "$@"; do
  source "default/${file}.sh"
done


exit 0
