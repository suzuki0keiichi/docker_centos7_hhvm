FROM centos:centos7

MAINTAINER Keiichi Suzuki

RUN yum install -y git gcc gcc-c++ vim cmake make boost boost-devel wget tar mariadb-devel memcached-devel libmemcached-devel libevent-devel libcurl-devel \
libxml2-devel  libxslt-devel expat-devel libicu-devel libzip2-devel bzip2-devel libbzip2-devel openldap-devel readline-devel \
readline-devel  elfutils-libelf-devel libdwarf-devel libcap-devel binutils-devel \
libjpeg-devel libpng-devel libvpx-devel freetype-devel gmp-devel libmagicwand-devel libyaml-devel ImageMagick-devel tbb-devel

RUN rpm -Uvh http://dl.fedoraproject.org/pub/epel/7/x86_64/e/epel-release-7-2.noarch.rpm
RUN yum install --enablerepo epel -y libmcrypt libmcrypt-devel gperftools gperftools-devel

RUN cd /usr/local/src/ && \
wget https://google-glog.googlecode.com/files/glog-0.3.3.tar.gz && \
tar -zxf glog-0.3.3.tar.gz

RUN cd /usr/local/src/glog-0.3.3 && \
./configure && \
make && \
make install

RUN cd /usr/local/src && \
wget http://www.geocities.jp/kosako3/oniguruma/archive/onig-5.9.5.tar.gz && \
tar -zxf onig-5.9.5.tar.gz

RUN cd /usr/local/src/onig-5.9.5 && \
./configure && \
make && \
make install

RUN cd /usr/local/src && \
wget http://caml.inria.fr/pub/distrib/ocaml-4.02/ocaml-4.02.0.tar.gz && \
tar -zxf ocaml-4.02.0.tar.gz

RUN cd /usr/local/src/ocaml-4.02.0 && \
./configure && \
make && \
make install

RUN cd /usr/local/src && \
git clone https://github.com/facebook/hhvm.git

RUN cd /usr/local/src/hhvm/ && \
git submodule update --init --recursive && \
env BOOST_ROOT=/usr/include/boost ./configure

