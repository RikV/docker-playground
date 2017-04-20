FROM ingensi/dockbeat

#COPY ./dockbeat.yml /etc/dockbeat/dockbeat.yml
RUN apt-get update && apt-get install -y \
   	 netcat && apt-get clean  
COPY dockbeat.template.json /etc/dockbeat/dockbeat.template.json

COPY ./docker-entrypoint.sh /
ENTRYPOINT ["/docker-entrypoint.sh"]
