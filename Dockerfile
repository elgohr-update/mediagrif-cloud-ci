FROM ubuntu:18.04
RUN apt update -y && \
  apt install python python-pip -y curl wget zip unzip && \
  pip install awscli && \
  wget https://releases.hashicorp.com/terraform/0.12.14/terraform_0.12.14_linux_amd64.zip && \
  unzip terraform_0.12.14_linux_amd64.zip -d /usr/bin/ && \
  curl --silent --location -o /usr/local/bin/kubectl https://amazon-eks.s3-us-west-2.amazonaws.com/1.14.6/2019-08-22/bin/linux/amd64/kubectl && \
  chmod +x /usr/local/bin/kubectl && \
  curl --silent --location -o /usr/local/bin/aws-iam-authenticator https://amazon-eks.s3-us-west-2.amazonaws.com/1.14.6/2019-08-22/bin/linux/amd64/aws-iam-authenticator && \
  chmod +x /usr/local/bin/aws-iam-authenticator && \
  wget https://get.helm.sh/helm-v2.14.3-linux-amd64.tar.gz && \
  tar -zxvf helm-v2.14.3-linux-amd64.tar.gz && \
  mv linux-amd64/helm /usr/local/bin/

RUN rm terraform_0.12.14_linux_amd64.zip \
  helm-v2.14.3-linux-amd64.tar.gz \
  linux-amd64/ -rf

ENTRYPOINT [ "/usr/bin/env" ]