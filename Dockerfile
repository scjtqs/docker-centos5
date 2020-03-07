FROM centos:5.11

COPY ./yum.repos.d/ /etc/yum.repos.d/
#RUN yum -y update
RUN yum -y install glibc.i686 xulrunner.i386 libXtst mysql-server mysql mysql-devel php53-cli php53-mysql php53-pdo php53 php53-mbstring php53=gd* openssl
RUN yum -y install gcc gcc-c++ make zlib-devel
RUN rpm -qi mysql-server \
    && service mysqld start \
    && service mysqld stop
RUN yum clean all
CMD ["/bin/bash"]
