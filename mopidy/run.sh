#!/bin/bash
set -e

options=$(cat /data/options.json | jq -r 'if .options then [.options[] | "-o "+.name+"="+.value ] | join(" ") else "" end')
config="/var/lib/mopidy/.config/mopidy/mopidy.conf"

mopidy --config $config $options
