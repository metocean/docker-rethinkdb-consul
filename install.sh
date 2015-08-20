#!/bin/sh
set -e

# install runit
cp -R /install/runit/* /

# install consul
apt-get update
apt-get install -y unzip
cd /bin
unzip /tmp/consul.zip
chmod +x /bin/consul
rm /tmp/consul.zip
apt-get remove -y unzip
rm -rf /var/lib/apt/lists/*
mv /install/consul /etc/service/consul
mkdir /consul
mkdir /consul-data

# install rethinkdb
mv /install/rethinkdb /etc/service
touch /etc/rethinkdb.conf

# install init.sh
mv /install/init.sh /sbin/initsh

rm -r /install