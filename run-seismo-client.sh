#! /usr/bin/env sh

set -e
set -v
set -x

cd /home/seismo

mongod \
  --fork \
  --dbpath /home/seismo/mongo-seismo \
  --logpath /home/seismo/mongo-logs

cd /home/seismo/seismogram-app/data-tools

sh mongo-import.sh

cd /home/seismo/seismogram-app/server

node app

cd /home/seismo

apache2ctl \
  -d /etc/apache2 \
  -DFOREGROUND
