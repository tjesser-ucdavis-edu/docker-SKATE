#! /usr/bin/env sh

cd /home/seismo/seismogram-app/data-tools

sh mongo-import.sh

cd /home/seismo/seismogram-app/server

node app
