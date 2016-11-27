docker-easybuild-centos7
========================

This is just [EasyBuild](https://hpcugent.github.io/easybuild/) in a CentOS image. When you start it up eb should be in your path by default.

```
$ docker run -ti rjeschmi/easybuild-centos7 /bin/bash
```

The --rm option removes the container when it exits. You will lose all your work, but if you were just testing something that is probably ok.

EasyBuild prefers that you don't run as root so it will start you as a user other than root (easybuild in the default case)

[![Build Status](https://travis-ci.org/rjeschmi/docker-easybuild-centos7.svg?branch=master)](https://travis-ci.org/rjeschmi/docker-easybuild-centos7)
