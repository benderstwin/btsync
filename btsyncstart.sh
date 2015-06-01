mkdir /appconfig
mkdir /appconfig/btsync
mkdir /downloads
mkdir /downloads/torrents
mkdir /downloads/torrents/watched
mkdir /downloads/torrents/complete

docker run -d --name btsync \
  -e USERID=1337 \
  -e GROUPID=1337 \
  -p 3369:3369 \
  -p 3369:3369/udp \
  -p 8888:8888 \
  -v /appconfig/btsync:/config \
  -v /downloads:/sync \
  -v /etc/localtime:/etc/localtime:ro \
  soellman/btsync-docker
