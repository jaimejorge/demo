#!/bin/bash

killall -9 etcd kube-apiserver kube-controller-manager kube-scheduler kube-proxy docker flanneld
kube-proxy --cleanup-iptables=true

mkdir -p /opt/work

echo "**************************************"
echo "Starting Masters."
echo "**************************************"

nohup etcd --data-dir /opt/work/etcd --listen-client-urls http://0.0.0.0:4001 --advertise-client-urls http://kube-master:4001 > etcd.log  2>&1 &

sleep 10

# set network configuration for Flannel.
etcdctl set /coreos.com/network/config '{ "Network": "10.1.0.0/16" }'

# setup flannel
nohup flanneld -etcd-endpoints http://kube-master:4001 >flannel.log 2>&1 &
sleep 1
source /run/flannel/subnet.env

# setup docker
ifconfig docker0 ${FLANNEL_SUBNET}
nohup docker daemon --bip=${FLANNEL_SUBNET} --mtu=${FLANNEL_MTU} >docker.log 2>&1 &

nohup kube-apiserver --admission_control=ServiceAccount --allow-privileged=true \
	--address=$(hostname -i) --etcd-servers=http://kube-master:4001 \
	--service-cluster-ip-range=10.1.0.0/16 --port=8888 >api.log 2>&1 &

nohup kube-controller-manager --master=http://kube-master:8888 \
	--service_account_private_key_file=/var/run/kubernetes/apiserver.key \
	--allocate-node-cidrs=true --cluster-cidr=10.1.0.0/16 >ctrl.log 2>&1 &

nohup kube-scheduler --address=$(hostname -i) --master=http://kube-master:8888 >sched.log 2>&1 &

# start kube-proxy
nohup kube-proxy --master=http://kube-master:8888 >proxy.log 2>&1 &
