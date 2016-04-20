FROM linuxserver/baseimage
MAINTAINER LinuxServer.io

ENV APTLIST="qbittorrent-nox"

# install packages
RUN apt-get update -q && \
apt-get install $APTLIST -qy && \

# cleanup
apt-get clean -y && \
rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

#Adding Custom files
COPY qBittorrent.conf /build/qBittorrent.conf

# Mappings and Ports
EXPOSE 8080
VOLUME /root/.config/qBittorrent
VOLUME /root/.local/share/data/qBittorrent
VOLUME /root/Downloads
