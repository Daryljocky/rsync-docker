#!/bin/sh
set -e

chmod 0600 /etc/rsyncd.d/rsync.secrets

rm -rf /var/run/rsyncd.pid

rsync --daemon --no-detach -v
