FROM debian:jessie

VOLUME /config

EXPOSE 8000

RUN echo "deb http://us.archive.ubuntu.com/ubuntu precise main universe" >> /etc/apt/sources.list
RUN apt-get update && apt-get install -y build-essential  curl tar python git gcc g++ make ca-certificates npm nodejs

# Add S6 for process management
RUN apt-get install -y curl  && cd /tmp && curl -L  https://github.com/just-containers/s6-overlay/releases/download/v1.11.0.1/s6-overlay-amd64.tar.gz > /tmp/s6-overlay-amd64.tar.gz && apt-get remove -y curl
RUN tar xzf /tmp/s6-overlay-amd64.tar.gz -C /

# Build codebox
RUN ln -s /usr/bin/nodejs /usr/bin/node
RUN npm install -g codebox

COPY update.sh /etc/services.d/update/run
RUN chmod 755 /etc/services.d/update/run

COPY codebox.sh /etc/services.d/codebox/run
RUN chmod 755 /etc/services.d/codebox/run


RUN  adduser --disabled-password --gecos "Codebox IDE" codebox

RUN cd ./usr/local/lib/node_modules/codebox/node_modules/shux/node_modules/pty.js && make clean && make


ENV PORT 8080
ENV WORKSPACE_DIR /config
ENV WORKSPACE_NAME "Configuration"
ENV WORKSPACE_PUBLIC false
ENV USER root
EXPOSE 8080

ENTRYPOINT ["/init"]
