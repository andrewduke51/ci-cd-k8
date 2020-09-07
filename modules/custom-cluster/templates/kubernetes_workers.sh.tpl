#!/bin/bash

# Install kubeadm and Docker
apt-get update
apt-get install -y apt-transport-https curl
curl https://packages.cloud.google.com/apt/doc/apt-key.gpg | apt-key add -
echo "deb https://apt.kubernetes.io/ kubernetes-xenial main" >/etc/apt/sources.list.d/kubernetes.list
apt-get update
apt-get install -y docker.io kubeadm

# Run kubeadm
kubeadm join ${PUBLIC_IP}:6443 \
--token ${TOKEN_ID} \
--discovery-token-unsafe-skip-ca-verification \
--node-name worker-${INDEX}

# Indicate completion of bootstrapping on this node
touch /home/ubuntu/done