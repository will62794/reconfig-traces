#!/bin/bash

tlc="/Users/william.schultz/Downloads/jdk-24.0.1.jdk/Contents/Home/bin/java -cp tla2tools.jar tlc2.TLC"

# $tlc -noGenerateSpecTE -config MongoRaftReconfig_t1.cfg MongoRaftReconfig.tla | tee traces/t1.txt
# $tlc -noGenerateSpecTE -config MongoRaftReconfig_t2.cfg MongoRaftReconfig.tla | tee traces/t2.txt
# $tlc -noGenerateSpecTE -config MongoRaftReconfig_t3.cfg MongoRaftReconfig.tla | tee traces/t3.txt
$tlc -noGenerateSpecTE -config MongoRaftReconfig_t4.cfg MongoRaftReconfig.tla | tee traces/t4.txt