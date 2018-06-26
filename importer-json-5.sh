#!/usr/bin/env bash
folders=99
for i in `seq 0 $folders`; do
    echo "$(date) >> importing folder ${i}..."
    mongoimport --jsonArray --mode merge --collection customer --file ./results/$i/combined-customers.json --db ycsb --username guest --password guest --authenticationDatabase admin --host c1:27117
    mongoimport --jsonArray --mode merge --collection order --file ./results/$i/combined-orders.json --db ycsb --username guest --password guest --authenticationDatabase admin --host c1:27117
done

#folders=100
#records=50000
#for i in `seq 1 $folders`; do
#    echo "$(date) >> importing folder ${i}..."
#    for j in `seq 0 $records`; do
#        n=$((i * $records + j))
#
#        mongoimport --quiet --mode merge --collection customer --file ./results/$i/customer---$n.json --db ycsb --username guest --password guest --authenticationDatabase admin --host c1:27117
#        mongoimport --quiet --mode merge --collection order --file ./results/$i/order---$n.json --db ycsb --username guest --password guest --authenticationDatabase admin --host c1:27117
#    done
#done