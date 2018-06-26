#!/usr/bin/env bash
for filepath in $(ls -d results/*/); do
  jq -c -s '.' $filepath/customer*.json > $filepath/combined-customers.json
  jq -c -s '.' $filepath/order*.json > $filepath/combined-orders.json
done