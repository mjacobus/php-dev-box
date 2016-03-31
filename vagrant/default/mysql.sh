#!/bin/bash

debconf-set-selections <<< 'mysql-server-5.5 mysql-server/root_password password root'
debconf-set-selections <<< 'mysql-server-5.5 mysql-server/root_password_again password root'
install mysql-server-5.5

as_vagrant "echo '[client]' > ~/.my.cnf"
as_vagrant "echo 'user=root' >> ~/.my.cnf"
as_vagrant "echo 'password=root' >> ~/.my.cnf"

exit_on_failure $?
