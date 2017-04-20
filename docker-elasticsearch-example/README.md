# Docker elasticsearch example 

##  Requirements

  - docker
  - docker-compose  (_https://docs.docker.com/compose/install/_)


### Elasticsearch

**IMPORTANT!!**

     services:
       elasticsearch:
         volumes:
          - /tmp/esdata:/usr/share/elasticsearch/data

Check where to store elasticsearch index data, **/tmp/esdata** is default.

## Run !!

     docker-compose up --build

## Try

elasticsearch --> http://hostname:9200
kibana  --> http://hostname:5601

## Push data!

Logstash is configured to receive JSON data:

    tcp {
      port => 9000
      add_field => { "input" => "json" }
      codec => json_lines
    }

.. useful to test any parsing/filtering configuration.

e.g.

    filter {
      if ![paas.namespace] {
        drop {}
      }
      json {
        source => "message"
        add_tag => [ "json_%{paas.namespace}" ]
      }
      if [_jsonparsefailure] in [tags] {
        drop {}
      }
    }

## Example data

    cat example-data.json | nc hostname 9000

.. and check your filters!

# Play!

