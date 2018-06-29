#!/usr/bin/env bash
start=$1
end=$2

echo "$(date) >> uploading folders: $start-$end"
for i in `seq $start $end`; do
    echo "$(date) >> importing folder $i..."
    mongoimport --numInsertionWorkers 8 --jsonArray --mode merge --collection customer --file ./results/$i/combined-customers.json --db ycsb --username guest --password guest --authenticationDatabase admin --host c1:27117 &
    mongoimport --numInsertionWorkers 8 --jsonArray --mode merge --collection order --file ./results/$i/combined-orders.json --db ycsb --username guest --password guest --authenticationDatabase admin --host c1:27117 &
    wait
done

#100 - 199 5M
#200 - 299 5M
#300 - 399 5M
#400 - 499 5M
#(500-100) * 50K = 20M


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