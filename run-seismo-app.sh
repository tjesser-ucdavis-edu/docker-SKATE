#! /usr/bin/env sh

set -e
set -v
set -x

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
