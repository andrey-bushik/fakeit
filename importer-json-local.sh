#!/usr/bin/env bash
folders=10
records=100
for i in `seq 1 $folders`; do
    echo "$(date) >> importing folder ${i}..."
    for j in `seq 0 $records`; do
        n=$((i * $records + j))

        mongoimport --quiet --db ycsb-local --mode merge --collection customer --file ./results/$i/customer---$n.json
        mongoimport --quiet --db ycsb-local --mode merge --collection order --file ./results/$i/order---$n.json
    done
done