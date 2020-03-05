FROM centos:5.11

COPY ./yum.repos.d/ /etc/yum.repos.d/
RUN yum -y update
RUN yum -y install xulrunner.i386 libXtst.i386 mysql-server mysql mysql-devel php-cli php-mysql php-pdo php
RUN rpm -qi mysql-server \
    && service mysqld start \
    && service mysqld stop
RUN yum clean all
CMD ["/bin/bash"]