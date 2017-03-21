FROM rjeschmi/easybuild-centos7:prereq

MAINTAINER Robert Schmidt <rjeschmi@gmail.com>

ENV EB_VER 3.1.1

USER root
WORKDIR /build
#ADD build/config-3.0.cfg /easybuild/etc/easybuild.d/30-config-3.0.cfg

RUN curl -O https://raw.githubusercontent.com/hpcugent/easybuild-framework/easybuild-framework-v${EB_VER}/easybuild/scripts/bootstrap_eb.py
RUN su -l -c 'module load lmod && python /build/bootstrap_eb.py /easybuild' - easybuild

ADD build/StdEnv.lua /easybuild/deps/lmod/lmod/modulefiles/Core/StdEnv.lua

USER easybuild
WORKDIR /export
