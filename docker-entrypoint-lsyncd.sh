#!/bin/sh
set -e

echo "$SYNC_PASSWORD" > /etc/lsyncd/rsyncd.password
sed -i "s/{{SERVER_IP}}/$SERVER_IP/g" /etc/lsyncd/lsyncd.conf
sed -i "s/{{SECTION}}/$SECTION/g" /etc/lsyncd/lsyncd.conf
chmod 0600 /etc/lsyncd/rsyncd.password

lsyncd -insist -nodaemon -log  Exec /etc/lsyncd/lsyncd.conf
