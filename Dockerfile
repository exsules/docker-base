# Exsules Base image is a ubuntu trusty image with all the dependencies needed by Exsules Platform
#
# VERSION               0.0.1

FROM       ubuntu:trusty
MAINTAINER Exsules <contact@exsules.com>

# Set locale
RUN locale-gen --no-purge en_US.UTF-8
ENV LC_ALL en_US.UTF-8
ENV DEBIAN_FRONTEND noninteractive

# First install apt needed utility package
RUN apt-get update && apt-get install -y software-properties-common wget

# Add postgresql Repository for 9.4
RUN apt-add-repository "deb http://apt.postgresql.org/pub/repos/apt/ trusty-pgdg main"
RUN wget -q -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc | apt-key add -

# First install of common packages
RUN apt-get update && \
    apt-get install -y \
    sudo \
    git \
    postgresql-client \
    postgresql-client-common \
    libpq-dev \
    curl \
    zip \
    unzip \
    wget

#RUN mkdir -p /var/run/sshd && echo 'root:exsulesbasecontainer' | chpasswd

# Update/Upgrad all packages on each build
ONBUILD RUN apt-get update && apt-get upgrade -y
