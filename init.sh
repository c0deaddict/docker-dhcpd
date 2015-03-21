#!/bin/bash -e
envsubst < /etc/dhcp/dhcpd.conf.tmpl > /etc/dhcp/dhcpd.conf
exec /usr/sbin/dhcpd -f -cf /etc/dhcp/dhcpd.conf --no-pid
