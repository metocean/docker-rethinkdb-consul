#!/bin/sh
set -e

# install runit
mv /install/runit/bin/* /usr/bin
mv /install/runit/sbin/* /usr/sbin
mkdir /etc/service

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

rm -r /install