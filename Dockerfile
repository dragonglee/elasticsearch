FROM docker.elastic.co/elasticsearch/elasticsearch:8.15.0

ARG ES_INITIAL_ADMIN_PASSWORD=changeme

ENV discovery.type=single-node \
    bootstrap.memory_lock=true \
    xpack.security.enabled=false \
    ES_JAVA_OPTS="-Xms1g -Xmx1g" \
    ES_INITIAL_ADMIN_PASSWORD=${ES_INITIAL_ADMIN_PASSWORD}

EXPOSE 9200
VOLUME ["/usr/share/elasticsearch/data"]
