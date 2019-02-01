#! /usr/bin/env sh

set -e
set -v
set -x

docker ps \
  --filter 'name=seismo-database-inst' \
  --filter 'name=seismo-server-inst' \
  --filter 'name=seismo-client-inst' \
  --quiet \
| xargs \
  --no-run-if-empty \
  docker stop

docker network rm seismo-app \
|| true
