# Simple Docker metric example with DockBeat + Elasticsearch + Grafana

## Run!

    docker-compose up --build

## Login!

  * Grafana: http://hostname:3000 (admin//admin)

## Setup: Grafana

  * Add data source --> type: elasticsearch, url: http://elasticsearch:9200, index name: dockbeat-\*
  * Create your dashboard! (e.g. Metric --> Sum --> cpu.totalUsage [...])

## Elastic

If you need to look what's in the index..

     curl 'hostname:9200/dockbeat-*/_search?pretty'
