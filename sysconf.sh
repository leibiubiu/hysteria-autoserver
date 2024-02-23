#!/bin/bash

mkdir -p config
cat <<EOF | awk '{print "curl "$1" -x 127.0.0.1:1081 -s -o config/config_"NR".config.new"}' | bash 
https://raw.githubusercontent.com/Alvin9999/pac2/master/hysteria/config.json
https://raw.githubusercontent.com/Alvin9999/pac2/master/hysteria/1/config.json
https://raw.githubusercontent.com/Alvin9999/pac2/master/hysteria/13/config.json
https://raw.githubusercontent.com/Alvin9999/pac2/master/hysteria/2/config.json
EOF

for file in config/*.config.new; do
  if [ -s "$file" ]; then
    mv "$file" "${file%.new}"
  fi
done



