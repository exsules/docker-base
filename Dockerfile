# Exsules Base image is a alpine image with all the dependencies needed by Exsules Platform
#
# VERSION               0.0.1

FROM       alpine:3.2
MAINTAINER exsules <contact@exsules.com>

# Set locale
ENV LC_ALL en_US.UTF-8

# First install apt needed utility package
RUN apk add --update \
  git \
  sudo \
  postgresql-client \
  postgresql-dev \
  curl \
  unzip \
  wget && \
  rm -rf /var/cache/apk/*

#RUN mkdir -p /var/run/sshd && echo 'root:exsulesbasecontainer' | chpasswd

# Update/Upgrad all packages on each build
ONBUILD RUN apk update && apk upgrade
