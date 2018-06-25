FROM debian:stretch-slim
MAINTAINER Rudy Gevaert <rudy.gevaert@gmail.com>
COPY 80-acquire-retries /etc/apt/apt.conf.d/
RUN apt-get update -yqq && apt-get upgrade -y
RUN apt-get install -y rubygems-integration ruby-dev ruby build-essential
RUN apt-get clean && rm -f /var/lib/apt/lists/* ; rm -f /var/lib/apt/lists/partial/*
RUN gem install -v 1.9.3 --no-ri --no-rdoc fpm
