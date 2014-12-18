FROM centos:centos6

MAINTAINER Robert Schmidt <rjeschmi@gmail.com>

RUN yum -y install git
RUN mkdir -p /build
ADD build/Lmod-5.8.tar.bz2 /build

WORKDIR /build/Lmod-5.8

RUN yum -y install epel-release make automake gcc gcc-c++ 
RUN yum -y install lua lua-devel lua-posix lua-filesystem tcl

RUN ./configure --prefix=/software/Lmod
RUN make install
RUN ln -s /software/Lmod/lmod/lmod/init/profile /etc/profile.d/modules.sh
RUN ln -s /software/Lmod/lmod/lmod/init/cshrc /etc/profile.d/modules.csh

RUN mkdir -p /software/easybuild-develop
ADD build/install-EasyBuild-develop.sh /build/install-EasyBuild-develop.sh
RUN /build/install-EasyBuild-develop.sh hpcugent /software/easybuild-develop


RUN mkdir -p /software/easybuild
ADD build/z99_StdEnv.sh /etc/profile.d/z99_StdEnv.sh
ADD build/config.cfg /software/config/config.cfg

RUN useradd -m build
RUN chown -R build.build /software/easybuild

VOLUME ['/software/easybuild']
