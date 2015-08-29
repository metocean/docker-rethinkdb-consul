# RethinkDB Consul
RethinkDB with Consul

`docker pull metocean/rethinkdb-consul`

Overmount the following files and folders to customise:
- `/consul/rethinkdb.json` - The RethinkDB [consul service definition file](https://www.consul.io/docs/agent/services.html). Mount an alternate to change the service registered with consul, e.g. change the service name or add tags.
- `/etc/rethinkdb.conf` - [Rethinkdb's configuration file](http://www.rethinkdb.com/docs/config-file/). Change how RethinkDB runs.
- `/rethinkdb-data` - Where RethinkDB stores it's data. Mount this from host for persistence.

# Note:
This docker will parse the service name and port from the consul service definition file `/consul/rethinkdb.json` and use those details to discover other RethinkDB instances to create a cluster. These IP addresses will be added to the rethinkdb startup command, e.g. `rethinkdb --join 172.17.0.46:28015`.

By default RethinkDB will bind to all interfaces, and will run with the default ports - e.g. 29015 for intracluster connections. The default consul service name is 'rethinkdb'.