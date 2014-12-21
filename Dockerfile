FROM centos:centos6

MAINTAINER Robert Schmidt <rjeschmi@gmail.com>
RUN sed "s/enabled.*$/enabled=0/" -i /etc/yum/pluginconf.d/fastestmirror.conf
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
WORKDIR /build
RUN curl -O https://raw.githubusercontent.com/hpcugent/easybuild-framework/develop/easybuild/scripts/bootstrap_eb.py 
RUN su -l -c 'module load lmod && python /build/bootstrap_eb.py /software/easybuild' - build

ADD build/z99_StdEnv.sh /etc/profile.d/z99_StdEnv.sh

RUN mkdir -p /export/easybuild
RUN useradd -u 1000 easybuild
RUN chown -R easybuild.easybuild /export

USER easybuild
WORKDIR /export/easybuild

VOLUME /export/easybuild
