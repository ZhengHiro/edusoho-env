FROM centos:centos6.7

RUN yum install wget \
    && yum check-update \
    && yum update \
    && setenforce 0

RUN wget http://nginx.org/packages/centos/6/noarch/RPMS/nginx-release-centos-6-0.el6.ngx.noarch.rpm \
    && rpm -ivh nginx-release-centos-6-0.el6.ngx.noarch.rpm \
    && yum install nginx \
    && chkconfig nginx on

RUN wget https://mirror.webtatic.com/yum/el6/latest.rpm \
    && rpm -ivh latest.rpm \
    && wget https://mirrors.ustc.edu.cn/epel/epel-release-latest-6.noarch.rpm \
    && rpm -ivh epel-release-latest-6.noarch.rpm \
    && yum install php70w php70w-cli php70w-common php70w-fpm php70w-gd php70w-mbstring php70w-intl php70w-mcrypt php70w-mysql php70w-mysql php70w-pdo php70w-xml \
    && chkconfig php-fpm on

EXPOSE 80
