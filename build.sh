#!/bin/bash

VERSION='2.1.7'
docker build --no-cache=true -t stefanofontanelli/cassandra .
docker push stefanofontanelli/cassandra:latest
docker tag -f stefanofontanelli/cassandra:latest stefanofontanelli/cassandra:$VERSION
docker push stefanofontanelli/cassandra:$VERSION
