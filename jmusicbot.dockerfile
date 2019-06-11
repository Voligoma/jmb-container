FROM ubuntu:19.04

ENV JMB_VERSION 0.2.3

RUN apt-get update && \
    apt-get install -y \
    openjdk-8-jre-headless && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* && \
    useradd --create-home appuser

WORKDIR /home/appuser
USER appuser

ADD https://github.com/jagrosh/MusicBot/releases/download/$JMB_VERSION/JMusicBot-$JMB_VERSION-Linux.jar ./JMusicBot.jar
ADD https://github.com/jagrosh/MusicBot/releases/download/$JMB_VERSION/config.txt ./config/config.txt

VOLUME /home/appuser/config

CMD cd /home/appuser/config && java -jar -Dnogui=true /home/appuser/JMusicBot.jar