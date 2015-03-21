FROM ubuntu:14.04

RUN apt-get update && \
    apt-get install -y isc-dhcp-server gettext

COPY init.sh /usr/local/sbin/
WORKDIR /usr/local/sbin
RUN chmod +x init.sh

CMD ["init.sh"]

EXPOSE 67/udp
EXPOSE 68/udp
