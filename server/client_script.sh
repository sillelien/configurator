
if [ ! -d /config/.git ]
then
   git clone git://${SCSERVER_PORT_9418_TCP_ADDR}:${SCSERVER_PORT_9418_TCP_PORT}/config /config
fi

cd /config

while true
do
    git pull origin master
    sleep 10
done
