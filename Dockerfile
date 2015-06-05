# BitTorrent Sync

FROM debian:7

MAINTAINER Bender77

# Download and extract the executable to /usr/bin
ADD https://download-cdn.getsyncapp.com/stable/linux-x64/BitTorrent-Sync_x64.tar.gz /btsync.tar.gz
RUN tar -xzvf btsync.tar.gz && rm btsync.tar.gz

#Grab the config
ADD https://github.com/benderstwin/btsync/blob/master/btsync.conf /btsync/btsync.conf

# Web GUI
EXPOSE 8888
# Listening port
EXPOSE 55555
ENTRYPOINT ["btsync"]
CMD ["--config", "/btsync/btsync.conf", "--nodaemon"]
