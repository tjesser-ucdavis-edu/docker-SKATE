#! /usr/bin/env sh

set -e
set -v
set -x

if ! docker network inspect seismo-app >/dev/null
then
  docker network create \
  --internal \
  seismo-app
fi

docker ps \
  --filter 'name=seismo-database-inst' \
  --filter 'name=seismo-server-inst' \
  --filter 'name=seismo-client-inst' \
  --quiet \
| xargs \
  --no-run-if-empty \
  docker stop

docker run \
  --detach \
  --name seismo-database-inst \
  --network seismo-app \
  --rm \
  seismo-database

docker run \
  --detach \
  --name seismo-server-inst \
  --network seismo-app \
  --publish 3000:3000 \
  --rm \
  seismo-server

docker run \
  --detach \
  --name seismo-client-inst \
  --network seismo-app \
  --publish 80:80 \
  --rm \
  seismo-client

docker network connect bridge seismo-server-inst

docker network connect bridge seismo-client-inst
