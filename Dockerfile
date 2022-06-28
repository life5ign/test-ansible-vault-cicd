# vanilla ansible image
FROM ubuntu:22.04

USER root

WORKDIR /root

RUN apt-get update && apt-get -y install \
  python3 \
  python3-pip
  
RUN pip install ansible

COPY . .

# it's necessary to set this variable somewhere, because ansible will otherwise give the warning that it's running in a world writable directory (in Bitbucket this happens to be /opt/atlassian/pipelines/agent/build)
ENV ANSIBLE_CONFIG=/root/ansible.cfg

RUN chmod 0700 vault_pass_from_env.sh

ENTRYPOINT ["/bin/bash"]
