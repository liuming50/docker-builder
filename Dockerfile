FROM ubuntu:16.04
MAINTAINER Ming Liu <liu.ming50@gmail.com>

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update && apt-get upgrade -y --fix-missing
RUN apt-get update && apt-get -y install automake bc bison bsdmainutils build-essential bzip2 ccache chrpath cpio curl debianutils diffstat dosfstools dpkg-dev gawk gcc-multilib gettext git git-core g++-multilib gperf locales iputils-ping libbz2-1.0 libbz2-dev libelf-dev libghc-bzlib-dev liblz4-tool libssl-dev libxml2-utils lzop make maven mtools openjdk-8-jdk optipng pngcrush python python3 python3-pexpect python3-pip python-mako python-networkx sbsigntool schedtool socat squashfs-tools texinfo unzip wget xz-utils zip zlib1g-dev
RUN ["locale-gen", "en_US.UTF-8"]
RUN ["dpkg-reconfigure", "locales"]

ADD start.sh /usr/local/bin/
ENTRYPOINT ["start.sh"]
