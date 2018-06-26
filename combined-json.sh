#!/usr/bin/env bash
for filepath in $(ls -d results/*/); do
#  jq -c -s '.' $filepath/customer*.json > $filepath/combined-customers.json
#  jq -c -s '.' $filepath/order*.json > $filepath/combined-orders.json

  find $filepath/customer*.json -maxdepth 1 -exec cat {} + | jq -s . > $filepath/combined-customers.json
  find $filepath/order*.json -maxdepth 1 -exec cat {} + | jq -s . > $filepath/combined-orders.json
done