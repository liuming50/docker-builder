#!/bin/bash

if [ "$3" == "" ] ; then
	echo "A build directory must be specified!"
	exit 1
fi

useradd -m -u $1 -g $2 -s /bin/bash builder

[ -c "$(tty)" ] && chmod a+rw $(tty)

# Zap the password for builder
[ -e /etc/shadow ] && sed -i 's%^builder:\*:%builder::%' /etc/shadow
[ -e /etc/passwd ] && sed -i 's%^builder:x:%builder::%' /etc/passwd

cp -rp /opt/docker-builder/builder-files/home /
chown -R builder: /home

# Set correct build dir
sed -i 's/##BUILD_DIR##/'$3'/' /home/builder/.bashrc

# Start builder
if [ "$5" != "" ] ; then
    su - builder -c "$5"
    exit $?
fi

su - builder
