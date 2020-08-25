#!/bin/bash

kops delete cluster kubernetes.${YOUR_DOMAIN} --state=s3://${YOUR_S3_BUCKET} --yes
exit 0
