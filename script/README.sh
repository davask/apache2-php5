#/usr/bin/env bash

branch=${1};
parentRepo=${2};
parentBranch=${3};
rootDir=${4};
buildDir=${5};

#############
# README.md #
#############

echo "# dockerfile

see [FROM IMAGE README.md](https://github.com/davask/d-apache2)

### PHP ${branch:0:1} activation

#### comment

- to avoid init error all conf file in /etc/apache2/sites-available have to be in the format of sub.domain.ext.conf like docker.davaskweblimited.com.conf

- On start all *.conf in /etc/apache2/sites-available are enabled

## LABEL

> dwl.app.language=\"php${branch:0:1}\"
" > ${rootDir}/README.md

echo "README.md generated with php:${branch}";
