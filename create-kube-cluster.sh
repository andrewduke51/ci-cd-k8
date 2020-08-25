#!/bin/bash

kops create cluster --name=kubernetes.${YOUR_DOMAIN} --state=s3://${YOUR_S3_BUCKET} --zones=us-east-1a --node-count=2 --node-size=t2.micro --master-size=t2.micro --dns-zone=kubernetes.${YOUR_DOMAIN} --yes
exit 0
