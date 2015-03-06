#!/bin/bash
CASSANDRA_IMAGE=stefanofontanelli/cassandra
CASSANDRA_VERSION=2.1.3
docker build --no-cache=true -t $CASSANDRA_IMAGE:$CASSANDRA_VERSION .
docker push $IMAGE:$VERSION