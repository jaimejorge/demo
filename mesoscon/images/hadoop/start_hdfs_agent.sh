#!/bin/bash

./sbin/hadoop-daemon.sh --config `pwd`/etc/hadoop --script hdfs start datanode

tail -f logs/hadoop-$(whoami)-datanode-$(hostname).log
