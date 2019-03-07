#!/bin/bash -x

name="$1"

# get os distribution name
distribution=$(lsb_release -a | grep "Distributor" | cut -f2  | tr -d ' ')

if [ $distribution != 'Fedora' ]; then
  status=$(sudo vbmc show  -f value $name | grep status | cut -f2 -d' ')
else
  status=$(sudo vbmc show  $name | grep status | cut -f3 -d'|' | tr -d ' ')
fi

if [[ $status != "running" ]]; then
    vbmc start $name
fi
