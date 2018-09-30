FROM centos:7

RUN yum install -y openssh-server openssh-clients sshpass
RUN yum install -y https://centos7.iuscommunity.org/ius-release.rpm
RUN yum install -y python36u python36u-libs python36u-devel python36u-pip
RUN pip3.6 install ansible

RUN mkdir /root/ansible
WORKDIR /root/ansible
