import boto3
from pathlib import Path

ssm = boto3.client('ssm', region_name='us-east-1')
parameter = ssm.get_parameter(Name='/cicd/ssh_key', WithDecryption=True)
FETCHED_SECRET=(parameter['Parameter']['Value'])
print(FETCHED_SECRET)

filename = Path("/root/.ssh/id_rsa")

outF = open(filename, 'w+')
for line in FETCHED_SECRET:
  outF.write(line)
#  outF.write("\n")
outF.close()