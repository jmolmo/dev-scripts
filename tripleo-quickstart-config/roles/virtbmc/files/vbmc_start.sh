#!/bin/bash -x

name="$1"

# get os distribution name
distribution=$(lsb_release -a | grep "Distributor" | cut -f2  | tr -d ' ')

if [ $distribution != 'Fedora' ]; then
  status_cmd="sudo vbmc show  -f value $name | grep status | cut -f2 -d' '"
else
  status_cmd="sudo vbmc show  $name | grep status | cut -f3 -d'|' | tr -d ' '"
fi

sudo vbmc start $name

#while [ $(eval "$status_cmd") != "running" ]; do
#  echo "Waiting for $name vbmc 'running' status"
#  sleep 3
#done
