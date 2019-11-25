FROM alpine:3.9

RUN apk add --no-cache lsyncd rsync bash && \
    mkdir -p /etc/lsyncd/conf.d/ /data/ /var/log/lsyncd/ /var/log/rsyncd/ /etc/rsyncd.d/

ADD lsyncd.conf /etc/lsyncd/

ADD docker-entrypoint-lsyncd.sh /
ADD docker-entrypoint-rsyncd.sh /

RUN chmod 0755 /docker-entrypoint-lsyncd.sh
RUN chmod 0755 /docker-entrypoint-rsyncd.sh
