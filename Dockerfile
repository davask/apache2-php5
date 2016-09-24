FROM davask/d-apache:2.4-u14.04
MAINTAINER davask <docker@davaskweblimited.com>
LABEL dwl.app.language="php5"

# Update packages
RUN /bin/bash -c 'apt-get update'
# INSTALL PHP5.5.9
# RUN apt-get install -y php5
# INSTALL PHP5.6.23
RUN /bin/bash -c 'apt-get install -y software-properties-common'
RUN /bin/bash -c 'add-apt-repository ppa:ondrej/php'
RUN /bin/bash -c 'apt-get update'
RUN /bin/bash -c 'apt-get install -y php5.6'
RUN /bin/bash -c 'apt-get install -y php5.6-mcrypt'
RUN /bin/bash -c 'apt-get install -y php5.6-mbstring'
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
# sendmail required to use php mail()
RUN /bin/bash -c 'apt-get install -y sendmail'
RUN /bin/bash -c 'rm -rf /var/lib/apt/lists/*'

# RUN /bin/bash -c 'echo "include(`/etc/mail/tls/starttls.m4\')dnl" >> /etc/mail/sendmail.mc'
# RUN /bin/bash -c 'echo "include(`/etc/mail/tls/starttls.m4\')dnl" >> /etc/mail/submit.mc'
# RUN /bin/bash -c 'sendmailconfig'

COPY ./tmp/dwl/sendmail.sh /tmp/dwl/sendmail.sh
COPY ./tmp/dwl/init.sh /tmp/dwl/init.sh
