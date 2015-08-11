#!/usr/bin/with-contenv bash

set -ex

curl http://${SCSERVER_PORT_1500_TCP_ADDR}:${SCSERVER_PORT_1500_TCP_PORT} | bash

sleep 10
