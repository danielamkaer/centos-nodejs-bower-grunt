FROM centos:7

MAINTAINER Daniel Amkær Sørensen <daniel.amkaer@gmail.com>

RUN echo '[ centos-nodejs-bower-grunt ]' > /etc/motd

RUN rpm -Uvh https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm
RUN rpm -Uvh http://rpms.famillecollet.com/enterprise/remi-release-7.rpm
RUN yum install -y gcc gcc-g++
RUN yum install -y python-pip git wget
RUN yum groupinstall -y "Development Tools"
RUN pip install awscli
RUN wget --quiet http://nodejs.org/dist/v0.10.33/node-v0.10.33.tar.gz
RUN tar zxf node-v* && cd node-v* && ./configure && make && make install
RUN npm install -g bower
RUN npm install -g grunt-cli

RUN yum clean all
