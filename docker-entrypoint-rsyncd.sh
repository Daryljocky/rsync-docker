#!/bin/sh
set -e

echo "$SECTION:$SYNC_PASSWORD" > /etc/rsyncd.d/rsync.secrets
sed -i "s/{{SECTION}}/$SECTION/g" /etc/rsyncd.conf
chmod 0600 /etc/rsyncd.d/rsync.secrets

rm -rf /var/run/rsyncd.pid

rsync --daemon --no-detach -v
