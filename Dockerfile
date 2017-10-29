FROM ubuntu:16.04
MAINTAINER Ming Liu <liu.ming50@gmail.com>

ENV DEBIAN_FRONTEND noninteractive

RUN ["apt-get", "update"]
RUN ["apt-get", "upgrade", "-y", "--fix-missing"]
RUN apt-get update && apt-get -y install locales build-essential python python3 git diffstat texinfo gawk chrpath wget cpio nano vim mc screen iptables lzop ca-certificates

RUN ["locale-gen", "en_US.UTF-8"]
RUN ["dpkg-reconfigure", "locales"]

ADD start.sh /usr/local/bin/
ENTRYPOINT ["start.sh"]
