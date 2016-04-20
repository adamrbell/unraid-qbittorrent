FROM linuxserver/baseimage
MAINTAINER LinuxServer.io

ENV APTLIST="qbittorrent-nox"

# install packages
RUN apt-get update -q && \
apt-get install $APTLIST -qy && \

# cleanup
apt-get clean -y && \
rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

ADD qBittorrent.conf /build/qBittorrent.conf

VOLUME /root/.config/qBittorrent
VOLUME /root/.local/share/data/qBittorrent
VOLUME /root/Downloads

EXPOSE 8080

ADD start.sh /
RUN chmod -v +x /start.sh
CMD ["/start.sh"]
