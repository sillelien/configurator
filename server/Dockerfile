FROM sillelien/jessy:0.3

VOLUME /repo
EXPOSE 9418
EXPOSE 11300
EXPOSE 1500

RUN apt-get update && apt-get install -y git  netcat-traditional socat beanstalkd bash

COPY git.sh /etc/services.d/git/run
COPY script_server.sh /etc/services.d/script_server/run
COPY beanstalk.sh /etc/services.d/beanstalk/run
COPY notifications.sh /etc/services.d/notifications/run
COPY client_script.sh /client_script.sh
COPY hooks/ /hooks/

RUN chmod 755 /etc/services.d/git/run  /etc/services.d/script_server/run /etc/services.d/beanstalk/run /etc/services.d/notifications/run

ENTRYPOINT ["/init"]
