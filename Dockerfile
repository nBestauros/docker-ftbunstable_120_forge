# syntax=docker/dockerfile:1

FROM openjdk:18.0.2-jdk-buster

LABEL version="1.0.0"

RUN apt-get update && apt-get install -y curl && \
 adduser --uid 99 --gid 100 --home /data --disabled-password minecraft

COPY launch.sh /launch.sh
RUN chmod +x /launch.sh

USER minecraft

VOLUME /data
WORKDIR /data

EXPOSE 25565/tcp

ENV MOTD "FTB Unstable 1.20: Forge Server Powered by Docker"
ENV LEVEL world
ENV JVM_OPTS "-Xms4096m -Xmx6144m"

CMD ["/launch.sh"]
