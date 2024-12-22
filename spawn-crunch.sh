#!/bin/bash

cd /local/repository
for i in `seq 1 $1`; do
    N=$(bc <<<"$i + 10")
    ./run-test.sh 16-tiered "crunch $N" $i &
    sleep 1
done

    
