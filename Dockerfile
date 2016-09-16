FROM davask/d-apache2:2.4-u14.04
MAINTAINER davask <contact@davaskweblimited.com>
USER root
LABEL dwl.app.language="php5"

# Update packages
RUN /bin/bash -c 'apt-get update'
# INSTALL PHP5.5.9
# RUN apt-get install -y php5
# INSTALL PHP5.6.23
RUN /bin/bash -c 'apt-get install -y software-properties-common'
RUN /bin/bash -c 'add-apt-repository -y ppa:ondrej/php'
RUN /bin/bash -c 'apt-get update'
RUN /bin/bash -c 'apt-get install -y php5.6'
RUN /bin/bash -c 'apt-get install -y php5.6-mcrypt'
RUN /bin/bash -c 'apt-get install -y php5.6-mysql'
RUN /bin/bash -c 'apt-get install -y php5.6-gd'
RUN /bin/bash -c 'apt-get install -y php5.6-curl'
RUN /bin/bash -c 'apt-get install -y php5.6-memcached'
RUN /bin/bash -c 'apt-get install -y php5.6-cli'
RUN /bin/bash -c 'apt-get install -y php5.6-readline'
RUN /bin/bash -c 'apt-get install -y php5.6-mysqlnd'
RUN /bin/bash -c 'apt-get install -y php5.6-json'
RUN /bin/bash -c 'apt-get install -y php5.6-xsl'
RUN /bin/bash -c 'apt-get install -y php5.6-xml'
RUN /bin/bash -c 'apt-get install -y php5.6-intl'
RUN /bin/bash -c 'apt-get install -y libapache2-mod-php5.6'
RUN /bin/bash -c 'apt-get install -y memcached'
RUN /bin/bash -c 'rm -rf /var/lib/apt/lists/*'

COPY ./tmp/dwl/init.sh /tmp/dwl/init.sh
