FROM rethinkdb

MAINTAINER Thomas Coats <t.coats@metocean.co.nz>

ENV GOMAXPROCS=2
ADD https://dl.bintray.com/mitchellh/consul/0.5.2_linux_amd64.zip /tmp/consul.zip
ADD . /install/
RUN /install/install.sh
CMD ["/sbin/initsh"]