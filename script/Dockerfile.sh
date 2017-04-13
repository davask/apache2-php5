#/usr/bin/env bash

branch=${1};
parentRepo=${2};
parentBranch=${3};
rootDir=${4};
buildDir=${5};

##############
# Dockerfile #
##############

echo "FROM davask/${parentRepo}:${parentBranch}
MAINTAINER davask <docker@davaskweblimited.com>
LABEL dwl.app.language=\"php${branch:0:1}\"" > ${rootDir}/Dockerfile
echo "
# Update packages
RUN apt-get update

# INSTALL PHP5.5.9 - see http://packages.ubuntu.com/search?keywords=php5
# RUN apt-get install -y php5
# INSTALL PHP5.6.23 - https://launchpad.net/~ondrej/+archive/ubuntu/php
RUN LC_ALL=C.UTF-8 add-apt-repository ppa:ondrej/php
# INSTALL PHP7.0.15 - see http://packages.ubuntu.com/search?keywords=php7
# RUN apt-get install -y php7

RUN apt-get update
RUN apt-get install -y php${branch:0:3}
RUN apt-get install -y php${branch:0:3}-mcrypt
RUN apt-get install -y php${branch:0:3}-mbstring
RUN apt-get install -y php${branch:0:3}-mysql
RUN apt-get install -y php${branch:0:3}-gd
RUN apt-get install -y php${branch:0:3}-curl
RUN apt-get install -y php${branch:0:3}-memcached
RUN apt-get install -y php${branch:0:3}-cli
RUN apt-get install -y php${branch:0:3}-readline
RUN apt-get install -y php${branch:0:3}-mysqlnd
RUN apt-get install -y php${branch:0:3}-json
RUN apt-get install -y php${branch:0:3}-xsl
RUN apt-get install -y php${branch:0:3}-xml
RUN apt-get install -y php${branch:0:3}-intl
RUN apt-get install -y libapache2-mod-php${branch:0:3}
RUN apt-get install -y memcached

# sendmail required to use php mail()
RUN apt-get install -y sendmail
RUN rm -rf /var/lib/apt/lists/*

COPY ./build/dwl/sendmail.sh /dwl/sendmail.sh
COPY ./build/dwl/init.sh /dwl/init.sh
" >> ${rootDir}/Dockerfile

echo "Dockerfile generated with letsencrypt";
