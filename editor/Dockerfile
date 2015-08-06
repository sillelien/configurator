FROM debian:jessie

VOLUME /config

EXPOSE 8000

#RUN echo "deb http://us.archive.ubuntu.com/ubuntu precise main universe" >> /etc/apt/sources.list
RUN  adduser --disabled-password --gecos "Codebox IDE" codebox

COPY build.sh /build.sh
RUN chmod 755 /build.sh
RUN /build.sh

COPY update.sh /etc/services.d/update/run
RUN chmod 755 /etc/services.d/update/run

COPY codebox.sh /etc/services.d/codebox/run
RUN chmod 755 /etc/services.d/codebox/run

ENV PORT 8080
ENV WORKSPACE_DIR /config
ENV WORKSPACE_NAME "Configuration"
ENV WORKSPACE_PUBLIC false
ENV USER root
EXPOSE 8080

ENTRYPOINT ["/init"]
