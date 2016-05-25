FROM davask/d-apache2:latest
MAINTAINER davask <contact@davaskweblimited.com>

LABEL dwl.app.language="php5"

RUN apt-get update
RUN apt-get install -y php5
RUN apt-get install -y libapache2-mod-php5
RUN apt-get install -y php5-mcrypt
RUN apt-get install -y php5-mysql
RUN apt-get install -y php5-gd
RUN apt-get install -y apache2-utils
RUN apt-get install -y sendmail
RUN rm -rf /var/lib/apt/lists/*

# Declare instantiation counter
ENV DWL_INIT_COUNT 2
# Copy instantiation specific file
COPY ./php5.sh $DWL_INIT_DIR/$DWL_INIT_COUNT-php5.sh
