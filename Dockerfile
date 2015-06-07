FROM bender77/debianbase

ENV BTSYNC_USER btsync
ENV UID 22000

RUN apt-get update && apt-get install -qy unzip
RUN useradd --no-create-home -g users --uid $UID $BTSYNC_USER
ADD https://download-cdn.getsyncapp.com/stable/linux-x64/BitTorrent-Sync_x64.tar.gz /btsync.tar.gz
RUN tar -xzvf btsync.tar.gz && rm btsync.tar.gz

USER $BTSYNC_USER
# Web GUI
EXPOSE 8888
# Listening port
EXPOSE 55555

#ENTRYPOINT ["btsync"]
CMD ["--config", "/btsync/btsync.conf", "--nodaemon"]
