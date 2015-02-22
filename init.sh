#!/bin/bash -e
export IP=$(/sbin/ip -o -4 addr list eth0 | awk '{print $4}' | cut -d/ -f1)
PAIR=$(netmask -s $IP | awk '{print $1}')
export NETWORK=$(echo $PAIR | cut -d/ -f1)
export NETMASK=$(echo $PAIR | cut -d/ -f2)

envsubst < /etc/dhcp/dhcpd.conf.tmpl > /etc/dhcp/dhcpd.conf

exec /usr/sbin/dhcpd -f -cf /etc/dhcp/dhcpd.conf --no-pid
