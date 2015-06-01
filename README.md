Building the Image

docker build -t btsync .

Running BitTorrent Sync

docker run -d -p 8888:8888 -p 55555:55555 -v /srv/btsync/:/btsync/ btsync

-d run in detached mode

-p expose container port [public-port]:[container-port]

    btsync.conf sets the container ports 8888 as the web ui and 55555 as the listening port

    If you do not explicitly set a public port, a random open port will be used because the ports are exposed in the Dockerfile

-v mount a local directory in the container [host-dir]:[container-dir]

    btsync.conf should be located in a directory mounted to the container directory /btsync/

