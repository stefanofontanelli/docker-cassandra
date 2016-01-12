FROM java:8-jre

MAINTAINER Stefano Fontanelli <s.fontanelli@gmail.com>

VOLUME ["/var/lib/cassandra"]

RUN curl -L http://debian.datastax.com/debian/repo_key | apt-key add -

ENV CASSANDRA_VERSION 2.1.12

RUN echo "deb http://debian.datastax.com/community stable main" > /etc/apt/sources.list.d/cassandra.sources.list

RUN    apt-get update \
    && apt-get install -ymq dsc21=$CASSANDRA_VERSION-1 cassandra=$CASSANDRA_VERSION python-pip \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN pip install cqlsh

COPY cassandra.sh /usr/local/bin/

EXPOSE 7199 7000 7001 9160 9042

CMD ["/usr/local/bin/cassandra.sh"]
