#!/usr/bin/with-contenv bash

set -ex

git config --global user.email "configurator@$(hostname)"
git config --global user.name "Configurator @ $(hostname)"

if [ ! -d /config/.git ]
then
   while ! git clone git://${SCSERVER_PORT_9418_TCP_ADDR}:${SCSERVER_PORT_9418_TCP_PORT}/config /config
   do
    echo "Retrying to connect to server"
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
while ! git pull
do
    sleep 10
done

rm -rf /config/.git/hooks/*.sample
cp -f /hooks/* /config/.git/hooks/
chmod a+x /config/.git/hooks/*

ls -la /config/.git/hooks/*

sleep 2147483647
