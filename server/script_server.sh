#!/usr/bin/with-contenv sh
while true ; do nc.traditional -l -p 1500 -c 'echo -e "HTTP/1.1 200 OK\n\n $(cat /client_script.sh)"'; done
sleep 10