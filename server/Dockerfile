FROM sillelien/jessy:0.3

VOLUME /repo
EXPOSE 9418

RUN apt-get update && apt-get install -y git  netcat-traditional

COPY git.sh /etc/services.d/git/run
COPY script_server.sh /etc/services.d/script_server/run
COPY client_script.sh /client_script.sh
RUN chmod 755 /etc/services.d/git/run  /etc/services.d/script_server/run

ENTRYPOINT ["/init"]
