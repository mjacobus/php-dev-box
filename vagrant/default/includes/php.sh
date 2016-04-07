#!/bin/bash

install python-software-properties
sudo add-apt-repository ppa:ondrej/php5-5.6
sudo apt-get -y update && sudo apt-get -y upgrade

install php5-fpm       \
        php5           \
        php5-cli       \
        php5-curl      \
        php5-gd        \
        php5-mysql     \
        php5-sqlite    \
        php5-intl      \
        php5-xsl       \
        php5-mcrypt    \
        php5-xdebug    \
        php5-mhash     \
        php5-memcache  \
        php5-memcached \
        php-apc

sudo php5enmod mcrypt
sudo php5enmod xdebug

exit_on_failure $?

function php_replace() {
  local find=$1
  local replace=$2
  local regexp="s/^$find$/$replace/g"

  sudo sed -i "$regexp" /etc/php5/fpm/php.ini
  exit_on_failure $?

  sudo sed -i "$regexp" /etc/php5/cli/php.ini
  exit_on_failure $?
}

php_replace "error_reporting =.*" "error_reporting = E_ALL"
php_replace "display_errors =.*" "display_errors = On"
php_replace "display_startup_errors =.*" "display_startup_errors = On"

sudo service php5-fpm restart
exit_on_failure $?

inform "Installing composer..."
if [ ! -f /usr/bin/composer ]; then
  curl -sS https://getcomposer.org/installer | php
  sudo mv composer.phar /usr/bin
  sudo ln -s /usr/bin/composer.phar /usr/bin/composer
fi

sudo composer self-update

sudo rm -f /etc/php5/cli/conf.d/20-xdebug.ini
