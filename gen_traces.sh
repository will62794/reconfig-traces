#!/bin/bash

tlc="java -cp tla2tools.jar tlc2.TLC"

traces="t1 t3-oplog-commitment t4"
for t in $traces; do
    $tlc -noGenerateSpecTE -config MongoRaftReconfig_$t.cfg MongoRaftReconfig.tla | tee traces/$t.txt
    grep -A 10000 "Invariant.*is violated" traces/$t.txt | grep -v "configTerm" > traces/$t-cleaned.txt
    echo "Generated traces/$t-cleaned.txt"
done


# $tlc -noGenerateSpecTE -config MongoRaftReconfig_t1.cfg MongoRaftReconfig.tla | tee traces/t1.txt
# $tlc -noGenerateSpecTE -config MongoRaftReconfig_t2.cfg MongoRaftReconfig.tla | tee traces/t2.txt
# $tlc -noGenerateSpecTE -config MongoRaftReconfig_t3.cfg MongoRaftReconfig.tla | tee traces/t3.txt
# $tlc -noGenerateSpecTE -config MongoRaftReconfig_t4.cfg MongoRaftReconfig.tla | tee traces/t4.txt
# grep "Invariant.*is violated" 