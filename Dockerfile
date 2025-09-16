#
# Sherlock Dockerfile
#
# https://github.com/
#

# Pull base image.
FROM debian:latest

LABEL org.opencontainers.image.authors="hihouhou < hihouhou@hihouhou.com >"

ENV SHERLOCK_VERSION=0.15.0

# Update & install packages
RUN apt-get update && \
    apt-get install -y git python3-pip

#Create sherlock user
RUN adduser --disabled-login --gecos 'Sherlock' sherlock

# Install
RUN rm /usr/lib/python3.11/EXTERNALLY-MANAGED && \
    git clone https://github.com/sherlock-project/sherlock.git && \
    cd sherlock && \
    pip3 install --no-cache-dir sherlock-project==$SHERLOCK_VERSION

WORKDIR /sherlock

USER sherlock

ENTRYPOINT ["sherlock"]
