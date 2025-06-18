#!/bin/bash

tlc="java -cp tla2tools.jar tlc2.TLC"

traces="t1 t3-oplog-commitment t4"
# traces="t1"
for t in $traces; do
    $tlc -difftrace -deadlock -noGenerateSpecTE -config MongoRaftReconfig_$t.cfg MongoRaftReconfig.tla | tee traces/$t.txt
    grep -A 10000 "Invariant.*is violated" traces/$t.txt | grep -v "configTerm" |\
     grep -B 10000 "states generated" | grep -v "states generated" |\
     grep -v "behavior up to this point is" |\
      sed "s/line.*of module/of/g" > traces/$t-cleaned.txt
    echo "Generated traces/$t-cleaned.txt"
done