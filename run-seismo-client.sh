#! /usr/bin/env sh

cd /home/seismo

apache2ctl \
  -d /etc/apache2 \
  -DFOREGROUND
