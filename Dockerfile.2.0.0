FROM rjeschmi/lmod

MAINTAINER Robert Schmidt <rjeschmi@gmail.com>


ADD build/config.cfg /software/config/config.cfg
RUN chown -R build.build /software

WORKDIR /build
RUN curl -O https://raw.githubusercontent.com/hpcugent/easybuild-framework/develop/easybuild/scripts/bootstrap_eb.py
RUN su -l -c 'module load lmod && python /build/bootstrap_eb.py /software/easybuild' - build

ADD build/z99_StdEnv.sh /etc/profile.d/z99_StdEnv.sh

RUN mkdir -p /export/easybuild
RUN useradd -u 1000 easybuild
RUN chown -R easybuild.easybuild /export

RUN yum -y install python-keyring zlib-devel openssl-devel libibverbs-devel unzip

ADD ./easybuild-docker.sh /usr/bin/easybuild-docker
RUN chmod +x /usr/bin/easybuild-docker

USER easybuild
WORKDIR /export/easybuild

VOLUME /export/easybuild

CMD ["/usr/bin/easybuild-docker"]
