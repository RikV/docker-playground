# Simple Docker metric example with Telegraf + Influxdb + Grafana

If you want to provision (automation?!) influxdb datasource:

    curl -XPOST -uadmin:admin -H "Accept: application/json" -H "Content-Type: application/json" "http://localhost/api/datasources/" -d @datasource-example.json

## Run!

    docker-compose up --build

## Login!

  * Grafana: http://hostname:3000 (admin//admin)
  * InfluxDB admin: http://hostname:8086
