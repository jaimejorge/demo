#!/bin/bash

./bin/hdfs namenode -format hdfs272

./sbin/hadoop-daemon.sh --config `pwd`/etc/hadoop --script hdfs start namenode

tail -f logs/hadoop-$(whoami)-namenode-$(hostname).log
