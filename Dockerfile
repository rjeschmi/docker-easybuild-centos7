FROM rjeschmi/lmod

MAINTAINER Robert Schmidt <rjeschmi@gmail.com>

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

ADD ./easybuild-docker.sh /usr/bin/easybuild-docker
RUN chmod +x /usr/bin/easybuild-docker

USER easybuild
WORKDIR /export/easybuild

VOLUME /export/easybuild

USER root
RUN yum -y install python-keyring zlib-devel openssl-devel libibverbs-devel unzip

USER easybuild

CMD ["/usr/bin/easybuild-docker"]

