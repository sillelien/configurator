#!/usr/bin/env bash
set -ex

if [ ! -d /config/.git ]
then
    while ! git clone git://${SCSERVER_PORT_9418_TCP_ADDR}:${SCSERVER_PORT_9418_TCP_PORT}/config /config
    do
        echo "Waiting for server"
        sleep 10
    done
    cd /config
    git checkout -b master
    git fetch --all
    git push -u origin master
fi

cd /config


git remote set-url origin git://${SCSERVER_PORT_9418_TCP_ADDR}:${SCSERVER_PORT_9418_TCP_PORT}/config
git branch --set-upstream-to=origin/master master

while true
do
    socat UDP4-RECVFROM:6666,ip-add-membership=224.1.0.1:$(hostname -i),fork EXEC:'git pull -u origin master'

done
