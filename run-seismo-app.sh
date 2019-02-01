#! /usr/bin/env sh

set -e
set -v
set -x

if [ ! docker network inspect seismo-app ]
then
  docker network create seismo-app
fi

docker ps \
  --filter 'name=seismo-database-run' \
  --filter 'name=seismo-server-run' \
  --filter 'name=seismo-client-run' \
  --quiet \
| xargs \
  docker stop

docker run \
  --detach \
  --name seismo-database-run \
  --network seismo-app \
  --rm \
  seismo-database

docker run \
  --detach \
  --name seismo-server-run \
  --network seismo-app \
  --rm \
  seismo-server

docker run \
  --detach \
  --name seismo-client-run \
  --network seismo-app \
  --publish 80:80 \
  --rm \
  seismo-client

docker network connect bridge seismo-client-run
