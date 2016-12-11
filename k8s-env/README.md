Kubernetes Test Environment
=

HowTo
==

1. Copy etcd, etcdctl, flanneld and kubernetes binaries into `bin`
2. Run `bootstrap.sh`


Requirements
==

1. The VMs need shared directory to access kubernetes binaries; so it's better to install the following plugin for VirtualBox.

```
vagrant plugin install vagrant-vbguest
```

2. Only tested with vagrant 1.9.1 & virtaulbox 5.1

