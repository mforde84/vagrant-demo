#!/bin/bash

apt-get update -y
apt-get upgrade -y
apt-get dist-upgrade -y

apt-get install apache2 php5-gd php-apc php5-curl php5-mcrypt php5-xdebug -y