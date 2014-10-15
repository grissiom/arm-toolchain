FROM ubuntu:14.04

MAINTAINER Grissiom <chaos.proton@gmail.com>

# TODO: import this from /etc/lsb-release
ENV DISTRIB_CODENAME trusty
ENV TOOLCHAIN_VERSION 4.8.4.2014q3-0trusty11

RUN echo "deb http://ppa.launchpad.net/terry.guo/gcc-arm-embedded/ubuntu $DISTRIB_CODENAME main" >> /etc/apt/sources.list
RUN echo "deb-src http://ppa.launchpad.net/terry.guo/gcc-arm-embedded/ubuntu $DISTRIB_CODENAME main" >> /etc/apt/sources.list

RUN apt-get update && apt-get install -y --force-yes gcc-arm-none-eabi=$TOOLCHAIN_VERSION
# Brought from the base Ubuntu Dockerfile to keep the image small.
RUN rm -rf /var/lib/apt/lists/*

CMD ["/usr/bin/bash"]
