
export MODULEPATH=$(/easybuild/deps/lmod/lmod/libexec/addto MODULEPATH /easybuild/easybuild-develop/modulefiles)
export MODULEPATH=$(/easybuild/deps/lmod/lmod/libexec/addto --append MODULEPATH /easybuild/modules/all/Core)
export MODULEPATH=$(/easybuild/deps/lmod/lmod/libexec/addto --append MODULEPATH /easybuild/modules/all)

if [ -z "$__Init_Default_Modules" -o -z "$LD_LIBRARY_PATH" ]; then
  __Init_Default_Modules=1; export __Init_Default_Modules;
    module load StdEnv
fi

