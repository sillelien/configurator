#!/usr/bin/with-contenv sh
git config --global user.email "configurator@$(hostname)"
git config --global user.name "Configurator @ $(hostname)"

if [ ! -d /config/.git ]
then
   while ! git clone git://${SCSERVER_PORT_9418_TCP_ADDR}:${SCSERVER_PORT_9418_TCP_PORT}/config /config
   do
    echo "Retrying to connect to server"
   done
   cd /config
fi

cd /config

git pull

sleep 2147483647
