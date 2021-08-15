#
# Sherlock Dockerfile
#
# https://github.com/
#

# Pull base image.
FROM debian:latest

MAINTAINER hihouhou < hihouhou@hihouhou.com >

ENV SHERLOCK_VERSION v0.0.0

# Update & install packages
RUN apt-get update && \
    apt-get install -y git python3-pip

# Install
RUN git clone https://github.com/sherlock-project/sherlock.git && \
    cd sherlock && \
    python3 -m pip install -r requirements.txt

WORKDIR /sherlock

ENTRYPOINT ["python", "sherlock.py"]
