git config --global user.email "configurator@$(hostname)"
git config --global user.name "Configurator @ $(hostname)"

set -x

while true
do

    if [ ! -d /config/.git ]
    then
       git clone git://${SCSERVER_PORT_9418_TCP_ADDR}:${SCSERVER_PORT_9418_TCP_PORT}/config /config
    fi
    cd /config
    git pull origin master
    sleep 10


done
