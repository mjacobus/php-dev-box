#!/bin/bash

function mecho() {
  echo -e '\E[32m'"\033[1m"
  echo "#############################################################################"
  echo "# $1"
  echo "#############################################################################"
  echo -e "\033[0m"
}

mecho "Updating index..."
  sudo apt-get update -y

mecho "Installing vim-gnome..."
  sudo apt-get install -y vim-gnome

mecho "Installing git..."
  sudo apt-get install -y git

mecho "Installing mysql-server..."
  sudo apt-get install -y mysql-server mysql-client

mecho "Installing curl, php-curl..."
  sudo apt-get install -y curl libcurl3 libcurl3-dev php5-curl

mecho "Installing php5..."
  sudo apt-get install -y php5

mecho "Installing php5-curl..."
  sudo apt-get install -y php5-curl

mecho "Installing php5-gd..."
  sudo apt-get install -y php5-gd

mecho "Installing php5-mysql mysql"
  sudo apt-get install -y php5-mysql

mecho "Installing php5-intl"
  sudo apt-get install php5-intl

mecho "Installing php5-xsl"
  sudo apt-get install php5-xsl

mecho "Installing php5-dev, pear, xdebug..."
  sudo apt-get install -y php5-dev php-pear
  sudo pecl install xdebug
  XDEBUG_PATH=`find /usr/lib/php5 -name xdebug.so`
  XDEBUG_CONF_PATH=/etc/php5/mods-available/xdebug.ini
  sudo echo "zend_extension=$XDEBUG_PATH" > /tmp/xdebug.ini
  sudo mv /tmp/xdebug.ini $XDEBUG_CONF_PATH
  sudo ln -s $XDEBUG_CONF_PATH /etc/php5/apache2/conf.d/30-xdebug.ini
  sudo ln -s $XDEBUG_CONF_PATH /etc/php5/cli/conf.d/30-xdebug.ini

mecho "Installing composer..."
  if ! [ -f /usr/local/bin/composer ]; then
    curl -sS https://getcomposer.org/installer | php
    sudo mv composer.phar /usr/bin
    sudo ln -s /usr/local/bin/composer.phar /usr/local/bin/composer
  fi

mecho "Installing silversearcher-ag, tmux, ctags"
  sudo apt-get install -y silversearcher-ag tmux ctags

mecho "Installing build-essential cmake"
  sudo apt-get install -y build-essential cmake

mecho "Installing python-dev"
  sudo apt-get install -y python-dev

mecho "Installing zshell..."
  sudo apt-get install -y zsh

mecho "Installing oh-my-zsh..."
  wget https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh -O - | zsh

mecho "Setting shell to zshell..."
  chsh -s `which zsh`

mecho "Creating empty git config file..."
  touch ~/.gitconfig

mecho "Installing dotfiles..."
  git clone http://github.com/mjacobus/.dotfiles.git ~/.dotfiles
  cd ~/.dotfiles && ./install.sh
  cd -
