#!/bin/sh

set -e

case "$1" in
	server)
		shift
		;;

	*)
		exec $*
		;;
esac

ASTERISK_BINARY="/usr/sbin/asterisk"
ASTERISK_USER="asterisk"
ASTERISK_OPTS="$*"

if [ -f /etc/custom-config/init.sh ]; then
	source /etc/custom-config/init.sh
fi

exec ${ASTERISK_BINARY} -U ${ASTERISK_USER} -f ${ASTERISK_OPTS}

