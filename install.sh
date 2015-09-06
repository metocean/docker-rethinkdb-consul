#!/bin/sh
set -e

apt-get update

# install runit
apt-get install -y runit
cp -R /install/runit/* /

# install consul
apt-get install -y unzip wget
cd /bin
unzip /tmp/consul.zip
chmod +x /bin/consul
rm /tmp/consul.zip
apt-get remove -y unzip
cp -R /install/consul/* /

# install rethinkdb
apt-get install -y python
pip install rethinkdb
cp -R /install/rethinkdb/* /

# install init.sh
cp -R /install/initsh/* /

rm -r /install
rm -rf /var/lib/apt/lists/*