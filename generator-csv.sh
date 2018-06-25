#!/usr/bin/env bash
for i in `seq 0 49`; do
    n=$((i * 100000))
    sed "s/%customer_id%/${n}/g" ./models/customers_template.yaml > ./models/customers_generated.yaml
    sed "s/%order_id%/${n}/g" ./models/orders_template.yaml > ./models/orders_generated.yaml

    echo " >> generating customers and orders for ids from ${n}"
    bin/fakeit -m ./models/customers_generated.yaml -n 100000 -o csv -d ./results-csv-$i
    bin/fakeit -m ./models/orders_generated.yaml -n 100000 -o csv -d ./results-csv-$i
    echo " >> done for ids starting from ${n}"
done