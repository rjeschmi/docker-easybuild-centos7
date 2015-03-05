FROM centos:centos6

MAINTAINER Robert Schmidt <rjeschmi@gmail.com>
RUN sed "s/enabled.*$/enabled=0/" -i /etc/yum/pluginconf.d/fastestmirror.conf
RUN sed "/^mirrorlist/s/^/#/" -i /etc/yum.repos.d/CentOS-Base.repo
RUN sed "/^#baseurl/s/^#//" -i /etc/yum.repos.d/CentOS-Base.repo
RUN useradd -m build

RUN yum -y install git tar which bzip2 \
            epel-release make automake gcc gcc-c++ patch
RUN mkdir -p /build
WORKDIR /build
RUN curl -LO http://github.com/TACC/Lmod/archive/5.8.tar.gz
RUN mv /build/5.8.tar.gz /build/Lmod-5.8.tar.gz
RUN tar xvf Lmod-5.8.tar.gz

WORKDIR /build/Lmod-5.8

RUN yum -y install lua lua-devel lua-posix lua-filesystem tcl

RUN ./configure --prefix=/software/Lmod
RUN make install
RUN ln -s /software/Lmod/lmod/lmod/init/profile /etc/profile.d/modules.sh
RUN ln -s /software/Lmod/lmod/lmod/init/cshrc /etc/profile.d/modules.csh
ADD build/config.cfg /software/config/config.cfg


RUN chown -R build.build /software

RUN mkdir -p /software/easybuild-develop
ADD build/install-EasyBuild-develop.sh /build/install-EasyBuild-develop.sh
RUN chmod +x /build/install-EasyBuild-develop.sh
RUN /build/install-EasyBuild-develop.sh hpcugent /software/easybuild-develop

ADD build/z99_StdEnv.sh /etc/profile.d/z99_StdEnv.sh

RUN mkdir -p /software/easybuild
RUN chown -R build.build /software/easybuild


RUN mkdir -p /export/easybuild
RUN useradd -u 1000 easybuild
RUN chown -R easybuild.easybuild /export

RUN yum -y install python-keyring zlib-devel openssl-devel libibverbs-devel

ADD ./easybuild-docker.sh /usr/bin/easybuild-docker
RUN chmod +x /usr/bin/easybuild-docker

USER easybuild
WORKDIR /export/easybuild

VOLUME /export/easybuild

CMD ["/usr/bin/easybuild-docker"]

