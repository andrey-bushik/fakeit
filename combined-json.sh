#!/usr/bin/env bash
start=$1
end=$2

#for filepath in $(ls -d results/*); do
for i in `seq $start $end`; do
  filepath=./results/$i
  echo $filepath
  find $filepath -type f -name 'customer*.json' -exec cat {} + | jq -c -s . > $filepath/combined-customers.json
  find $filepath -type f -name 'order*.json' -exec cat {} + | jq -c -s . > $filepath/combined-orders.json

#  for i in *; do cp "$i" ../prjshp/; done
#  > $filepath/combined-customers.json
#  > $filepath/combined-orders.json

#  find -maxdepth 1 -name \*.json -exec cat {} + | jq -s . > output.json

#  jq -s '{} * .[1]' $filepath/combined-customers.json >> >> $filepath/combined-customers.json
#  find $directory -type f -name '*' -exec mv {} $directory2/. \;

#  find $filepath -maxdepth 1 -name "customer*.json" | jq -f -c -s '.' > $filepath/combined-customers.json
#   jq --arg x "${api_final}" '.item = $x'
#
#   zargs $filepath/customer*.json -- cat | jq -s . > $filepath/combined-customers.json
#   zargs $filepath/order*.json -- cat | jq -s . > $filepath/combined-orders.json

#  xargs $filepath/customer*.json -- cat | jq -f -c -s . > $filepath/combined-customers.json
#  xargs $filepath/order*.json -- cat | jq -f -c -s . > $filepath/combined-orders.json

#  find $filepath -name 'customer*.json' -exec jq -c -s '{}' + > $filepath/combined-customers.json
#  find $filepath -name 'order*.json' -exec jq -c -s '{}' + > $filepath/combined-orders.json

#  find . -name '$filepath/customer*.json' -exec cat '{}' + | jq -f -c -s '.' > $filepath/combined-customers.json
#  find . -name '$filepath/order*.json' -exec cat '{}' + | jq -f -c -s '.' > $filepath/combined-orders.json
#  jq -f -c -s '.' $filepath/customer*.json > $filepath/combined-customers.json
#  jq -f -c -s '.' $filepath/order*.json > $filepath/combined-orders.json
#
#
done