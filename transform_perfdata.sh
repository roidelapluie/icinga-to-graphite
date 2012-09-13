#!/bin/bash
carbon_host=10.0.1.42
carbon_port=2003

tmpfile="$(mktemp)"
mv "$1" "$tmpfile"
awk -f transform_perfdata.awk < "$tmpfile" > /dev/tcp/${graphite_host}/${graphite_port}
rm "$tmpfile"
