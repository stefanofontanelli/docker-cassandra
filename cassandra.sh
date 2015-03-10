#!/bin/bash
ADDR=$(ip addr | grep 'inet ' | grep eth0 | cut -d/ -f1 | awk '{print $2}')

echo "Cassandra will bind to $ADDR"

sed -i -e "s/listen_address: localhost/listen_address: $ADDR/g" /etc/cassandra/cassandra.yaml
cat /etc/cassandra/cassandra.yaml | grep "listen_address"

sed -i -e "s/rpc_address: localhost/rpc_address: $ADDR/g" /etc/cassandra/cassandra.yaml
cat /etc/cassandra/cassandra.yaml | grep "rpc_address"

sed -i -e "s/- seeds: \"127.0.0.1\"/- seeds: \"$ADDR\"/g" /etc/cassandra/cassandra.yaml
cat /etc/cassandra/cassandra.yaml | grep "seeds:"

cassandra -f
