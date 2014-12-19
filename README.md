docker-easybuild-centos6
========================

This is just [EasyBuild](https://hpcugent.github.io/easybuild/) in a CentOS image. When you start it up eb should be in your path by default.

```sh
$ docker run -ti rjeschmi/easybuild-centos6 /bin/bash
```

You might also want to use the --rm option so you don't pollute your process list `docker ps -a` for that list
