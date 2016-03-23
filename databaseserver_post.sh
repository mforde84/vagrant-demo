#!/bin/bash

apt-get update -y
apt-get upgrade -y
apt-get dist-upgrade -y

sudo debconf-set-selections <<< 'mysql-server-5.5 mysql-server/root_password password root_password'
sudo debconf-set-selections <<< 'mysql-server-5.5 mysql-server/root_password_again password root_password'

sudo apt-get -y install mysql-server-5.5 php5 php5-mysql apache2 php5-gd php-apc php5-curl php5-mcrypt php5-xdebug -y