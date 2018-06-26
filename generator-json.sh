#!/usr/bin/env bash
folders=100
records=50000
for i in `seq 0 $folders`; do
    n=$((i * $records))
    sed "s/%customer_id%/${n}/g" ./models/customers_template.yaml > ./models/customers_generated.yaml
    sed "s/%order_id%/${n}/g" ./models/orders_template.yaml > ./models/orders_generated.yaml

    echo "$(date) >> generating customers and orders for ids from ${n}"
    bin/fakeit -m ./models/customers_generated.yaml,./models/orders_generated.yaml -n $records -o json -d ./results/$i
done