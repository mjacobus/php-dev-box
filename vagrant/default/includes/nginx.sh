#!/bin/bash

sudo add-apt-repository -y ppa:nginx/stable
sudo apt-get -y update
install nginx

PATH_AVAILABLE=/etc/nginx/sites-available
PATH_ENABLED=/etc/nginx/sites-enabled
TARGET_AVAILABLE=$PATH_AVAILABLE/vagrant
TARGET_ENABLED=$PATH_ENABLED/vagrant

sudo rm -f "${PATH_ENABLED}/default"
template $TARGET_AVAILABLE

sudo ln -sf $TARGET_AVAILABLE $TARGET_ENABLED
exit_on_failure $?

sudo service nginx restart
exit_on_failure $?

sudo ln -sf $TARGET_AVAILABLE $TARGET_ENABLED
exit_on_failure $?

# change ownership of services
sudo sed -i 's/www-data/vagrant/g' /etc/php5/fpm/pool.d/www.conf
sudo sed -i 's/www-data/vagrant/g' /etc/nginx/nginx.conf

PUBLIC_FOLDER=''

if [ -d /vagrant/public ]; then
  PUBLIC_FOLDER='\/public'
fi

sudo sed -i "s/_my_public_folder/$PUBLIC_FOLDER/g" $TARGET_AVAILABLE

# http://stackoverflow.com/questions/21422426/i-add-a-line-of-text-to-my-css-file-garbage-comes-through-the-browser
sudo sed -i 's/sendfile on/sendfile off/g' /etc/nginx/nginx.conf

restart_service php5-fpm
restart_service nginx
