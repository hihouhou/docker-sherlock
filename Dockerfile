#
# Sherlock Dockerfile
#
# https://github.com/
#

# Pull base image.
FROM debian:latest

MAINTAINER hihouhou < hihouhou@hihouhou.com >

ENV SHERLOCK_VERSION 0.15.0

# Update & install packages
RUN apt-get update && \
    apt-get install -y git python3-pip

#Create sherlock user
RUN adduser --disabled-login --gecos 'Sherlock' sherlock

# Install
RUN git clone https://github.com/sherlock-project/sherlock.git && \
    cd sherlock && \
    python3 -m pip install -r requirements.txt

WORKDIR /sherlock

USER sherlock

ENTRYPOINT ["python", "sherlock.py"]
