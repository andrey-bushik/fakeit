#!/usr/bin/env bash
folders=9
for i in `seq 0 $folders`; do
    echo "$(date) >> importing folder ${i}..."
    mongoimport --jsonArray --mode merge --collection customer --file ./results/$i/combined-customers.json --uri mongodb://localhost:27017/ycsb-local
    mongoimport --jsonArray --mode merge --collection order --file ./results/$i/combined-orders.json --uri mongodb://localhost:27017/ycsb-local
done

#folders=10
#records=100
#for i in `seq 1 $folders`; do
#    echo "$(date) >> importing folder ${i}..."
#    for j in `seq 0 $records`; do
#        n=$((i * $records + j))
#
#        mongoimport --quiet --mode merge --collection customer --file ./results/$i/customer---$n.json --uri mongodb://localhost:27017/ycsb-local
#        mongoimport --quiet --mode merge --collection order --file ./results/$i/order---$n.json --uri mongodb://localhost:27017/ycsb-local
#    done
#done