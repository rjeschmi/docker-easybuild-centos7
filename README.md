docker-easybuild-centos6
========================

This is just [EasyBuild](https://hpcugent.github.io/easybuild/) in a CentOS image. When you start it up eb should be in your path by default.

```sh
$ docker run --user="build" -ti rjeschmi/easybuild-centos6 /bin/bash
```

The --rm option removes the container when it exits. You will lose all your work, but if you were just testing something that is probably ok.

EasyBuild prefers that you don't run as root so the --user option is necessary

You will need to build a toolchain for this to be useful, or checkout [rjeschmi/easybuild-foss2014b](https://registry.hub.docker.com/u/rjeschmi/easybuild-foss-2014b/) to get started with something a bit more useful
