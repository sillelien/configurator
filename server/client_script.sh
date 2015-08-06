git config --global user.email "configurator@$(hostname)"
git config --global user.name "Configurator @ $(hostname)"

set -x

while true
do

    if [ ! -d /config/.git ]
    then
       git clone git://${SCSERVER_PORT_9418_TCP_ADDR}:${SCSERVER_PORT_9418_TCP_PORT}/config /config
       git checkout -b master
       git pull
       git push -u origin master
    fi
    cd /config
    git pull
    sleep 10


done
