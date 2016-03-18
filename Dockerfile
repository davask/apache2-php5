FROM davask/apache2
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
RUN apt-get install -y cpanminus

RUN rm -rf /var/lib/apt/lists/*

RUN cpanm YAML::XS

RUN rm -rf /var/lib/apt/lists/*

COPY ./dwl-yaml2virtualhost-0-app.pl /tmp/dwl-yaml2virtualhost-0-app.pl
COPY ./dwl-env2yaml-0-app.sh /tmp/dwl-env2yaml-0-app.sh
COPY ./dwl-init-2-app-reverse.sh /tmp/dwl-init-2-app-reverse.sh
