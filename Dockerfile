# dockerhub - A repository for various dockerfiles
# For more information; http://github.com/cmfatih/dockerhub
#
# phantomjs
#
# Usage
#   docker run cmfatih/phantomjs /usr/bin/phantomjs -v
#   docker run cmfatih/phantomjs /usr/bin/casperjs --version
#   docker run -v `pwd`:/mnt/test cmfatih/phantomjs /usr/bin/phantomjs /mnt/test/test.js

# VERSION 1.0.1

FROM ubuntu:12.04

MAINTAINER cmfatih

# Env
ENV PHANTOMJS_VERSION 1.9.7

# Commands
RUN \
  apt-get update && \
  apt-get upgrade -y && \
  apt-get install -y vim git wget libfreetype6 libfontconfig bzip2 && \
  mkdir -p /srv/var && \
  wget -q --no-check-certificate -O /tmp/phantomjs-$PHANTOMJS_VERSION-linux-x86_64.tar.bz2 https://bitbucket.org/ariya/phantomjs/downloads/phantomjs-$PHANTOMJS_VERSION-linux-x86_64.tar.bz2 && \
  tar -xjf /tmp/phantomjs-$PHANTOMJS_VERSION-linux-x86_64.tar.bz2 -C /tmp && \
  rm -f /tmp/phantomjs-$PHANTOMJS_VERSION-linux-x86_64.tar.bz2 && \
  mv /tmp/phantomjs-$PHANTOMJS_VERSION-linux-x86_64/ /srv/var/phantomjs && \
  ln -s /srv/var/phantomjs/bin/phantomjs /usr/bin/phantomjs && \
  git clone https://github.com/n1k0/casperjs.git /srv/var/casperjs && \
  ln -s /srv/var/casperjs/bin/casperjs /usr/bin/casperjs && \
  apt-get autoremove -y && \
  apt-get clean all

COPY main.js /usr/src/app/main.js

CMD ["/usr/bin/phantomjs","--ignore-ssl-errors=true","/usr/src/app/main.js"]
