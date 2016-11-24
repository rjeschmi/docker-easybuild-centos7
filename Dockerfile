FROM rjeschmi/easybuild-centos7:prereq

MAINTAINER Robert Schmidt <rjeschmi@gmail.com>


ADD build/install-EasyBuild-develop.sh /build/install-EasyBuild-develop.sh
RUN chmod +x /build/install-EasyBuild-develop.sh
RUN /build/install-EasyBuild-develop.sh hpcugent /easybuild/easybuild-develop

USER easybuild
