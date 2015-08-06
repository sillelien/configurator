#!/usr/bin/with-contenv sh

set -ex

curl http://${SCSERVER_PORT_1500_TCP_ADDR}:${SCSERVER_PORT_1500_TCP_PORT} | sh

sleep 10
