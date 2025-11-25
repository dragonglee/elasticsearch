FROM docker.elastic.co/elasticsearch/elasticsearch:8.15.0

ARG ES_INITIAL_ADMIN_PASSWORD=changeme

ENV discovery.type=single-node \
    bootstrap.memory_lock=true \
    xpack.security.enabled=false \
    ES_JAVA_OPTS="-Xms1g -Xmx1g" \
    ES_INITIAL_ADMIN_PASSWORD=${ES_INITIAL_ADMIN_PASSWORD}

HEALTHCHECK --interval=60s --timeout=10s --start-period=60s --retries=5 CMD curl -fs http://localhost:9200/_cluster/health || exit 1

EXPOSE 9200
VOLUME ["/usr/share/elasticsearch/data"]
