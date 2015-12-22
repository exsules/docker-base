# Exsules Base image is a alpine image with all the dependencies needed by Exsules Platform
#
# VERSION               0.0.1

FROM       alpine:3.2
MAINTAINER exsules <contact@exsules.com>

# Set locale
ENV LC_ALL en_US.UTF-8
ENV LANG en_US.utf8

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

ENV S6_VERSION 1.16.0.0

RUN curl -sSL https://github.com/just-containers/s6-overlay/releases/download/v${S6_VERSION}/s6-overlay-amd64.tar.gz -o /tmp/s6-overlay.tar.gz
RUN tar -zxf /tmp/s6-overlay.tar.gz -C /

#RUN mkdir -p /var/run/sshd && echo 'root:exsulesbasecontainer' | chpasswd

# Update/Upgrad all packages on each build
ENTRYPOINT ["/init"]

ONBUILD RUN apk update && apk upgrade
