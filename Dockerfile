FROM java:8-jre

MAINTAINER Stefano Fontanelli <s.fontanelli@gmail.com>

RUN curl -L http://debian.datastax.com/debian/repo_key | apt-key add -

ENV CASSANDRA_VERSION 2.1.3

RUN echo "deb http://debian.datastax.com/community stable main" > /etc/apt/sources.list.d/cassandra.sources.list

RUN    apt-get update \
    && apt-get install -ymq dsc21=$CASSANDRA_VERSION-1 cassandra=$CASSANDRA_VERSION \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN pip install cqlsh

VOLUME /var/lib/cassandra

EXPOSE 7199 7000 7001 9160 9042

CMD ["cassandra"]

