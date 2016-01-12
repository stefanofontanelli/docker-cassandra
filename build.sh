#!/bin/bash

VERSION='2.1.12'
docker build --no-cache=true -t gild/cassandra .
docker push gild/cassandra:latest
docker tag -f gild/cassandra:latest gild/cassandra:$VERSION
docker push gild/cassandra:$VERSION
