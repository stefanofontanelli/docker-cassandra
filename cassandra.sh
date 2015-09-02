#!/bin/bash
ADDR=$(ip addr | grep 'inet ' | grep eth0 | cut -d/ -f1 | awk '{print $2}')
CONF=/etc/cassandra/cassandra.yaml

echo "Cassandra will bind to $ADDR"

sed -i -e "s/listen_address: localhost/listen_address: $ADDR/g" $CONF
grep "listen_address" $CONF

sed -i -e "s/rpc_address: localhost/rpc_address: $ADDR/g" $CONF
grep "rpc_address" $CONF

sed -i -e "s/- seeds: \"127.0.0.1\"/- seeds: \"$ADDR\"/g" $CONF
grep "seeds:" $CONF

cassandra -f
