#!/bin/bash

set -e

if [[ ! -f "/opt/otter/zookeeper/conf/zoo.cfg" ]]; then
    mv /opt/otter/zookeeper/conf/zoo_sample.cfg /opt/otter/zookeeper/conf/zoo.cfg
    for server in $ZOO_SERVERS; do
        echo "$server" >> "/opt/otter/zookeeper/conf/zoo.cfg"
    done
fi

# Write myid only if it doesn't exist
if [[ ! -f "/data/zookeeper/myid" ]]; then
    echo "${ZOO_MY_ID:-1}" > "/data/zookeeper/myid"
fi

exec "$@"
