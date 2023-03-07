FROM ubuntu:latest

RUN apt update
RUN apt install vim git unzip wget curl -y
RUN wget https://releases.hashicorp.com/terraform/1.3.9/terraform_1.3.9_linux_amd64.zip
RUN unzip terraform_1.3.9_linux_amd64.zip
RUN mv terraform /usr/local/bin/ 


RUN wget https://github.com/gruntwork-io/terragrunt/releases/download/v0.44.4/terragrunt_linux_amd64
RUN mv terragrunt_linux_amd64 terragrunt 
RUN chmod u+x terragrunt 
RUN mv terragrunt /usr/local/bin/ 

RUN curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
RUN unzip awscliv2.zip
RUN ./aws/install

COPY credentials /root/.aws/
COPY config /root/.aws/
