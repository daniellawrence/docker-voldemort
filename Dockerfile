FROM java:7

RUN apt-get update && apt-get install -y wget unzip

ENV VOLDEMORT_VERSION=release-1.9.17-cutoff
RUN wget https://github.com/voldemort/voldemort/archive/$VOLDEMORT_VERSION.zip
RUN unzip $VOLDEMORT_VERSION.zip && mv voldemort-* voldemort

WORKDIR /voldemort/

ENV VOLDEMORT_HOME /voldemort/config/single_node_cluster
RUN ./gradlew clean jar

EXPOSE 6666 6667 8081

CMD ./bin/voldemort-server.sh

