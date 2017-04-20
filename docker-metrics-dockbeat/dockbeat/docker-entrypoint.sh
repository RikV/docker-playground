#!/bin/bash

set -e
ELASTICSEARCH_HOST=elasticsearch
ELASTICSEARCH_PORT=9200

echo 'Waiting for Elasticsearch cluster to be available...'
sleep 10

while ! nc -w 1 $ELASTICSEARCH_HOST $ELASTICSEARCH_PORT 2>/dev/null
do
  echo 'Elasticsearch is still not available, sleeping 10 seconds...'
  sleep 10
done

echo 'Configuring dockerbeat template...'
curl --silent -XPUT "http://$ELASTICSEARCH_HOST:$ELASTICSEARCH_PORT/_template/dockbeat" -d@dockbeat.template.json; echo

echo 'Starting dockerbeat...'
dockbeat -e -c dockbeat.yml
