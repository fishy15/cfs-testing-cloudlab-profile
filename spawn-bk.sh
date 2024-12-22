#!/bin/bash

cd /local/repository
for i in `seq 1 $1`; do
    N=$(bc <<<"5 * $i + 10")
    ./run-test.sh 16-tiered "bk $N" $i &
    sleep 1
done
