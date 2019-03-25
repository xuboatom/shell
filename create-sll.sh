#!/bin/sh
if test -z $1; then
        echo 'please input arguments like ./create-ssl.sh <domain>'
        exit 1
fi
wget https://dl.eff.org/certbot-auto
chmod a+x certbot-auto
apt-get update
apt-get purge -y python-virtualenv python3-virtualenv virtualenv
apt install python-pip -y
pip install --upgrade pip
pip install virtualenv
mv /root/.pip/pip.conf /root/.pip/pip.conf_bak
./certbot-auto certonly --nginx -m qwzhou89@icloud.com --agree-tos -d $1
