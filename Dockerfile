FROM alpine:3.9

RUN apk add --no-cache lsyncd rsync bash && \
    mkdir -p /etc/lsyncd/conf.d/ /data/ /var/log/lsyncd/ /var/log/rsyncd/ /etc/rsyncd.d/

ADD lsyncd.conf /etc/lsyncd/
ADD rsyncd.conf /etc/

ADD docker-entrypoint.sh /

RUN chmod 0755 /docker-entrypoint.sh

ENTRYPOINT ["/docker-entrypoint.sh"]
