#!/bin/bash

# Install kubeadm and Docker
apt-get update
apt-get install -y apt-transport-https curl
curl https://packages.cloud.google.com/apt/doc/apt-key.gpg | apt-key add -
echo "deb https://apt.kubernetes.io/ kubernetes-xenial main" >/etc/apt/sources.list.d/kubernetes.list
apt-get update
apt-get install -y docker.io kubeadm

# Run kubeadm
kubeadm init \
--token "${TOKEN_ID}" \
--token-ttl 15m \
--apiserver-cert-extra-sans "${PUBLIC_IP}" \
--pod-network-cidr "10.80.81.0/25" \
--node-name master

# Indicate completing of bootstrapping
sleep 120s
cp /etc/kubernetes/admin.conf /home/ubuntu
chown ubuntu:ubuntu /home/ubuntu/admin.conf
cp /home/ubuntu/admin.conf /tmp
chown ubuntu:ubuntu /tmp/admin.conf
kubectl --kubeconfig /home/ubuntu/admin.conf config set-cluster kubernetes --server https://${PUBLIC_IP}:6443
touch /home/ubuntu/done