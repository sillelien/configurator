#!/usr/bin/with-contenv sh

if [ -n "$SC_USER" ]
then
    users="$SC_USER:$SC_PASSWORD"
else
    users="insecure:insecure"
fi

codebox --title "Sillelien Configurator" --users $users --port 8080 --email user@sillelien.com run /config
