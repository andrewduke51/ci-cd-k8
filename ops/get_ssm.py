import boto3
ssm = boto3.client('ssm', region_name='us-east-1')
parameter = ssm.get_parameter(Name='/cicd/ssh_key', WithDecryption=True)
FETCHED_SECRET=(parameter['Parameter']['Value'])
print(FETCHED_SECRET)

outF = open("~/.ssh/id_rsa", "w")
for line in FETCHED_SECRET:
  outF.write(line)
#  outF.write("\n")
outF.close()