# custom pythan image
FROM ubuntu:16.04

RUN mkdir ~/.aws
COPY ops/config ~/.aws/config
ENV TERRAFORM_VERSION 0.12.29
RUN apt-get update && apt-get install -y \
        software-properties-common
    RUN add-apt-repository ppa:deadsnakes/ppa
    RUN apt-get update && apt-get install -y \
        python3.7 \
        python3-venv \
        iputils-ping \
        telnet \
        unzip \
        openssh-server \
        rsync \
        curl \
        python3-pip
    RUN python3.7 -m pip install pip
    RUN apt-get update && apt-get install -y \
        python-distutils-extra \
        python3-setuptools
# Install any needed packages specified in requirements.txt
COPY requirements.txt .
RUN pip3 install --upgrade pip
RUN pip3 install -r requirements.txt
RUN apt-get autoremove -y
RUN pip3 install --upgrade pip

RUN curl -LO https://github.com/kubernetes/kops/releases/download/$(curl -s https://api.github.com/repos/kubernetes/kops/releases/latest | grep tag_name | cut -d '"' -f 4)/kops-linux-amd64
RUN chmod +x kops-linux-amd64 && mv kops-linux-amd64 /usr/local/bin/kops

RUN curl -LO "https://storage.googleapis.com/kubernetes-release/release/$(curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt)/bin/linux/amd64/kubectl"
RUN chmod +x ./kubectl && mv ./kubectl /usr/local/bin/kubectl

RUN curl -LO "https://releases.hashicorp.com/terraform/${TERRAFORM_VERSION}/terraform_${TERRAFORM_VERSION}_linux_amd64.zip"
RUN unzip terraform_${TERRAFORM_VERSION}_linux_amd64.zip -d /usr/local/bin && mkdir ~/.ssh && touch ~/.ssh/authorized_keys && touch ~/.ssh/known_hosts