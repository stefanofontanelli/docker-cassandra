docker build --no-cache=true -t stefanofontanelli/cassandra .
docker push stefanofontanelli/cassandra:latest
docker tag -f stefanofontanelli/cassandra:latest stefanofontanelli/cassandra:2.1.3
docker push stefanofontanelli/cassandra:2.1.3