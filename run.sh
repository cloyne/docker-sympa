#!/bin/bash -e

# A script for running this image at the Cloyne deployment. See the README file for details.

mkdir -p /srv/var/log/sympa
mkdir -p /srv/sympa/etc/includes
mkdir -p /srv/sympa/etc/shared
mkdir -p /srv/sympa/spool
mkdir -p /srv/sympa/nullmailer
mkdir -p /srv/sympa/data

docker stop sympa || true
sleep 1
docker rm sympa || true
sleep 1
docker run --detach=true --restart=always --name sympa --hostname sympa \
 --env VIRTUAL_HOST=cloyne.org --env VIRTUAL_ALIAS=/lists,/lists-static/ \
 --env SET_REAL_IP_FROM=172.18.0.0/16 --env REMOTES=mail \
 --net="server2.cloyne.org" \
 --volume /srv/sympa/etc/shared:/etc/sympa/shared \
 --volume /srv/var/log/sympa:/var/log/sympa \
 --volume /srv/sympa/data:/var/lib/sympa \
 --volume /srv/sympa/nullmailer:/var/spool/nullmailer \
 --volume /srv/sympa/spool:/var/spool/sympa \
 --volume /srv/sympa/etc/includes:/etc/sympa/includes \
 cloyne/sympa
