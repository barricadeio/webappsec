# start with a base image
FROM ubuntu:14.04.2
MAINTAINER Barricade <engineering@barricade.io> 

# Few environment variables
ENV WAPITI_VERSION 2.3.0
ENV LANG C.UTF-8

# install dependencies
RUN apt-get update && \
    apt-get install -y build-essential make \
                       libidn11-dev \
                       libssl-dev \
                       libpcre3-dev \
                       python2.7 \ 
                       wget \ 
                       libcurl3-openssl-dev \
                       python2.7 python2.7-dev \
                       python-requests \ 
                       python-ctypes \ 
                       python-beautifulsoup

RUN wget -nv -O /tmp/wapity.tar.gz \
        http://netcologne.dl.sourceforge.net/project/wapiti/wapiti/wapiti-$WAPITI_VERSION/wapiti-$WAPITI_VERSION.tar.gz && \
        mkdir -p /usr/local/wapiti && \
        tar -xf /tmp/wapity.tar.gz -C /tmp && \
        mv /tmp/wapiti-$WAPITI_VERSION/* /usr/local/wapiti && \
        cd /usr/local/wapiti && \
        chmod u+x bin/wapiti
# Worked?
RUN /usr/local/wapiti/bin/wapiti --help | head -1
