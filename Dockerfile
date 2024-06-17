FROM ubuntu:24.04

# ENV TZ=Europe/Amsterdam
ENV TZ=Etc/UTC
ENV LANG=C.UTF-8

RUN apt-get update && DEBIAN_FRONTEND=noninteractive apt-get install -y \
    apt-transport-https \
    wget \
    ca-certificates \
    curl \
    gnupg2 \
    lsb-release \
    inetutils-telnet \
    iputils-ping \
    netcat-openbsd \
    vim-tiny \
    iproute2

## New dig (w.o. perl)
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y \
    knot-dnsutils \
    traceroute \
    mtr-tiny \
    net-tools \
    nmap \
    tcpdump \
    whois \
    webfs \
    && ln -s /usr/bin/kdig /usr/bin/dig


# A simple webserver
RUN printf "#!/bin/sh\nwebfsd -F -p 8000 -r /var/local/\n" >> /usr/local/bin/webserver && chmod +x /usr/local/bin/webserver

EXPOSE 8000

## Run
CMD ["sh", "-c", "echo 'starting webserver on port 8000' && webserver"]