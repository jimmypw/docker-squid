#!/bin/bash
if [ ! -d ${PREFIX}/var/cache/squid/00 ]; then
	echo "Bootstrapping cache..."
	${PREFIX}/sbin/squid -N -z
	echo "Bootstrap complete..."
fi

${PREFIX}/sbin/squid -N -d 9
