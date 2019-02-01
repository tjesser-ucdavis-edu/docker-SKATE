#! /usr/bin/env sh

set -e
set -v
set -x

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
