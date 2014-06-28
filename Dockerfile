FROM ubuntu:14.04
MAINTAINER graham@grahamc.com

ADD http://download-lb.utorrent.com/endpoint/btsync/os/linux-x64/track/stable /tmp/btsync.tar.gz

RUN adduser --system --disabled-password --disabled-login --uid 9001 btsync

RUN mkdir -p /opt/btsync
RUN tar -zvvxf /tmp/btsync.tar.gz -C /opt/btsync
RUN rm /tmp/btsync.tar.gz

VOLUME ["/mount/data", "/mount/config"]
EXPOSE 3369
EXPOSE 3369/udp
EXPOSE 8888

USER btsync
CMD ["--config", "/mount/config/btsync.conf"]
ENTRYPOINT ["/opt/btsync/btsync", "--nodaemon"]

