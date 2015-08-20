FROM centos:7

MAINTAINER Daniel Amkær Sørensen <daniel.amkaer@gmail.com>

RUN echo '[ centos-nodejs-bower-grunt ]' > /etc/motd

RUN rpm -Uvh https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm
RUN rpm -Uvh http://rpms.famillecollet.com/enterprise/remi-release-7.rpm
RUN yum install -y gcc gcc-g++
RUN yum install -y python-pip git wget
RUN pip install awscli
RUN wget http://nodejs.org/dist/v0.10.33/node-v0.10.33.tar.gz
RUN tar zxvf node-v* && cd node-v*
RUN ./configure
RUN make
RUN make install
RUN npm install -g bower
RUN npm install -g grunt-cli

RUN yum clean all
