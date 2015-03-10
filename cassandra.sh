#!/bin/bash
ADDR=$(ip addr | grep 'inet ' | grep eth0 | cut -d/ -f1 | awk '{print $2}')
sed -i "s/listen_address: localhost/listen_address: $ADDR/g" /etc/cassandra/cassandra.yaml
sed -i "s/rpc_address: localhost/rpc_address: 0.0.0.0/g" /etc/cassandra/cassandra.yaml
sed -i "s/# broadcast_rpc_address: 1.2.3.4/broadcast_rpc_address: $ADDR/g" /etc/cassandra/cassandra.yaml
sed -i 's/#MAX_HEAP_SIZE="4G"/MAX_HEAP_SIZE="4G"/g' /etc/cassandra/cassandra-env.sh
sed -i 's/#HEAP_NEWSIZE="800M"/HEAP_NEWSIZE="800M"/g' /etc/cassandra/cassandra-env.sh
cassandra -f