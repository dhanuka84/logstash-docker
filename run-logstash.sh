#!/bin/sh
docker run -p 8200:8200 \
        --name logstash \
        --rm \
        --ulimit nofile=65536:65536 --ulimit memlock=-1:-1 \
        -e "ES_JAVA_OPTS=-Xms512m -Xmx512m" -e bootstrap.memory_lock=true  \
	-v  /home/dhanuka/projects/docker/logstash-docker/logstash.conf:/usr/share/logstash/pipeline/logstash.conf \
	-v  /home/dhanuka/projects/docker/logstash-docker/logstash.yml:/usr/share/logstash/config/logstash.yml \
        docker.elastic.co/logstash/logstash:6.3.2

