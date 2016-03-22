FROM davask/d-apache2
MAINTAINER davask <contact@davaskweblimited.com>

LABEL dwl.app.language="php5"

# disable interactive functions
ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update
RUN apt-get install -y php5
RUN apt-get install -y libapache2-mod-php5
RUN apt-get install -y php5-mcrypt
RUN apt-get install -y php5-mysql

RUN apt-get install -y apache2-utils

RUN rm -rf /var/lib/apt/lists/*

COPY ./dwl-init-2-php5.sh /tmp/dwl-init-2-php5.sh
