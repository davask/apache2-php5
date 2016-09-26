FROM davask/d-apache:2.4-u14.04
MAINTAINER davask <docker@davaskweblimited.com>
LABEL dwl.app.language="php"

# Update packages
RUN /bin/bash -c 'apt-get update'
RUN /bin/bash -c 'apt-get install -y php5'
# RUN /bin/bash -c 'apt-get install -y libapache2-mod-php5'
# RUN /bin/bash -c 'apt-get install -y lsof'
# RUN /bin/bash -c 'apt-get install -y php5-readline'
# RUN /bin/bash -c 'apt-get install -y php5-json'
# RUN /bin/bash -c 'apt-get install -y php5-common'
# RUN /bin/bash -c 'apt-get install -y php5-cli'
# RUN /bin/bash -c 'apt-get install -y psmisc'
RUN /bin/bash -c 'apt-get install -y php-apc'
RUN /bin/bash -c 'apt-get install -y php5-curl'
RUN /bin/bash -c 'apt-get install -y php5-gd'
RUN /bin/bash -c 'apt-get install -y php5-intl'
RUN /bin/bash -c 'apt-get install -y php5-mcrypt'
RUN /bin/bash -c 'apt-get install -y php5-memcached'
RUN /bin/bash -c 'apt-get install -y php5-mysql'
RUN /bin/bash -c 'apt-get install -y php5-mysqlnd'
RUN /bin/bash -c 'apt-get install -y php5-xsl'
# RUN /bin/bash -c 'apt-get install -y php5-mbstring'
# RUN /bin/bash -c 'apt-get install -y php5-xml'
# sendmail required to use php mail()
RUN /bin/bash -c 'apt-get install -y sendmail'
RUN /bin/bash -c 'rm -rf /var/lib/apt/lists/*'

# RUN /bin/bash -c 'echo "include(`/etc/mail/tls/starttls.m4\')dnl" >> /etc/mail/sendmail.mc'
# RUN /bin/bash -c 'echo "include(`/etc/mail/tls/starttls.m4\')dnl" >> /etc/mail/submit.mc'
# RUN /bin/bash -c 'sendmailconfig'

# Setup Composer
RUN /bin/bash -c 'curl -sS https://getcomposer.org/installer | php;'
RUN /bin/bash -c 'mv composer.phar /usr/local/bin/composer;'

COPY ./tmp/dwl/sendmail.sh /tmp/dwl/sendmail.sh
COPY ./tmp/dwl/init.sh /tmp/dwl/init.sh
