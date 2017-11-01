FROM ubuntu:latest

MAINTAINER Andrei-Mihai Nicolae <a.mihai.nicolae@gmail.com>
LABEL tools="chrome node npm"

# Install deps
RUN apt-get update && apt-get install -y \
    apt-transport-https \
    ca-certificates \
    curl \
    groff-base \
    --no-install-recommends

# Get Chrome sources
RUN curl -sSL https://dl.google.com/linux/linux_signing_key.pub | apt-key add - \
    && echo "deb [arch=amd64] https://dl.google.com/linux/chrome/deb/ stable main" > /etc/apt/sources.list.d/google-chrome.list

# Install Chrome
RUN apt-get update && apt-get install -y \
    google-chrome-stable \
    --no-install-recommends

# Find your desired version here: https://deb.nodesource.com/node_8.x/pool/main/n/nodejs/
# Ubuntu 16.04.3 LTS (Xenial Xerus) (https://wiki.ubuntu.com/Releases)
RUN curl https://deb.nodesource.com/node_8.x/pool/main/n/nodejs/nodejs_8.8.1-1nodesource1~xenial1_amd64.deb > node.deb \
 && dpkg -i node.deb \
 && rm node.deb

RUN npm install -g yarn@1.2.1
