FROM sillelien/base-alpine:0.9.2

RUN apk -Uuv add inotify-tools git

COPY update.sh /etc/services.d/update/run
RUN chmod 755 /etc/services.d/update/run
