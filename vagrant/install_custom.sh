#!/bin/bash

source ~vagrant/repo/vagrant/config.sh

if (($# == 0)); then
  # installs all the custom files
  for file in `ls custom | grep .sh`; do
    source "custom/$file"
  done

  exit 0
fi

for file in "$@"; do
  source "custom/${file}.sh"
done

exit 0
