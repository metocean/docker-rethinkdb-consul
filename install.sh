#!/bin/sh
set -e

# install runit
cp -R /install/runit/* /

# install consul
apt-get update
apt-get install -y unzip wget
cd /bin
unzip /tmp/consul.zip
chmod +x /bin/consul
rm /tmp/consul.zip
apt-get remove -y unzip
rm -rf /var/lib/apt/lists/*
cp -R /install/consul/* /

# install rethinkdb
cp -R /install/rethinkdb/* /

# install init.sh
mv /install/init.sh /sbin/initsh

rm -r /install