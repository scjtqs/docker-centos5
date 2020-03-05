FROM centos:5.11

COPY ./yum.repos.d/ /etc/yum.repos.d/
RUN yum -y update
RUN yum -y install xulrunner.i386 libXtst.i386 mysql-server mysql mysql-devel php53-cli php53-mysql php53-pdo php53
RUN rpm -qi mysql-server \
    && service mysqld start \
    && service mysqld stop
RUN yum clean all
CMD ["/bin/bash"]