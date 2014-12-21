FROM ubuntu:14.04

RUN apt-get update
RUN apt-get install -y wget 
RUN wget https://github.com/downloads/voldemort/voldemort/voldemort-0.96.zip

RUN apt-get install -y unzip
RUN unzip voldemort-0.96.zip

RUN apt-get install -y openjdk-7-jre-headless

ENV VOLDEMORT_HOME /voldemort-0.96/config/single_node_cluster
WORKDIR /voldemort-0.96/

EXPOSE 6666 6667 8081

CMD ./bin/voldemort-server.sh

