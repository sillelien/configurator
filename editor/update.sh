#!/usr/bin/with-contenv sh
git config --global user.email "configurator@$(hostname)"
git config --global user.name "Configurator @ $(hostname)"

if [ ! -d /config/.git ]
then
   git clone git://${SCSERVER_PORT_9418_TCP_ADDR}:${SCSERVER_PORT_9418_TCP_PORT}/config /config
   cd /config
fi

cd /config

git pull

sleep 3600
