FROM davask/d-apache2
MAINTAINER davask <contact@davaskweblimited.com>

LABEL dwl.app.language="php5"

RUN apt-get update
RUN apt-get install -y php5
RUN apt-get install -y libapache2-mod-php5
RUN apt-get install -y php5-mcrypt
RUN apt-get install -y php5-mysql

RUN apt-get install -y apache2-utils

RUN rm -rf /var/lib/apt/lists/*

# Copy instantiation specific file
COPY ./php5.sh $DWL_INIT_DIR/$DWL_INIT_COUNT-php5.sh
# update counter for next container
RUN DWL_INIT_COUNT=$(($DWL_INIT_COUNT+1))
