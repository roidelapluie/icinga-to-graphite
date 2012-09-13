#!/bin/bash
carbon_host=10.0.1.42
carbon_port=2003
awk_sript="/usr/local/lib/transform_perfdata.awk"

tmpfile="$(mktemp)"
mv "$1" "${tmpfile}"
awk -f "${awk_script}"< "$tmpfile" > /dev/tcp/${carbon_host}/${carbon_port}
rm "${tmpfile}"
