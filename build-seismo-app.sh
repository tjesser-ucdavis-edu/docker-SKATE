#! /usr/bin/env sh

set -e
set -v
set -x

if [ ! docker network inspect seismo-app ]
then
  docker network create seismo-app
fi

docker build \
  --file=seismo-database-dockerfile \
  --tag=seismo-database \
  .

docker build \
  --file=seismo-server-dockerfile \
  --tag=seismo-server \
  .

docker build \
  --file=seismo-client-dockerfile \
  --tag=seismo-client \
  .
