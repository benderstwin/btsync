# BitTorrent Sync

FROM debian:latest

MAINTAINER Bender77

# Download and extract the executable to /usr/bin
ADD http://download-new.utorrent.com/endpoint/btsync/os/linux-x64/track/stable /usr/bin/btsync.tar.gz
RUN cd /usr/bin && tar -xzvf btsync.tar.gz && rm btsync.tar.gz

#Grab the config
ADD https://github.com/benderstwin/btsync/blob/master/btsync.conf /btsync.conf

# Web GUI
EXPOSE 8888
# Listening port
EXPOSE 55555

#Set storage path
"storage_path" : "/btsync/.sync"

ENTRYPOINT ["btsync"]
CMD ["--config", "/btsync/btsync.conf", "--nodaemon"]
