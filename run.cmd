#!/bin/bash

cd $(dirname $0)

nextcfg=$(((basename $(realpath config/config.config) ; ls config | grep config_ ) | sort | uniq -c | sed -e 's/^\s*//' ; echo  1 config_1.config ) | grep -A 1 ^2 | tail -1 | awk '{print $2}')

cd config
ln -sf $nextcfg config.config
cd - 1> /dev/null

nohup ./hysteria-linux-armv5 -c config/config.config 2>&1 1> ./proxy.log

