
export MODULEPATH=$(/software/Lmod/lmod/lmod/libexec/addto --append MODULEPATH /software/easybuild-develop/modulefiles)
export MODULEPATH=$(/software/Lmod/lmod/lmod/libexec/addto --append MODULEPATH /software/easybuild/modules/all)
export EASYBUILD_CONFIGFILES=/software/config/config.cfg

module load module-EasyBuild-develop
