#!/usr/bin/env bash
folders=100
records=50000
for i in `seq 1 $folders`; do
    echo "$(date) >> importing folder ${i}..."
    for j in `seq 0 $records`; do
        n=$((i * $records + j))

        mongoimport --quiet --db ycsb --mode merge --collection customer --file ./results/$i/customer---$n.json #--uri mongodb://guest:guest@c1:27117,c1:27217,c1:27317
        mongoimport --quiet --db ycsb --mode merge --collection order --file ./results/$i/order---$n.json #--uri mongodb://guest:guest@c1:27117,c1:27217,c1:27317
    done
done