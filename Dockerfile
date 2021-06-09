# Download base image ubuntu 20.04
FROM ubuntu:20.04
# Set YOUR MACHINE's architecture (probably amd64)
ARG ARCHITECTURE="amd64"
# Get workdirectory from docker-compose
ARG WORK_DIRECTORY="/home/pandoc-paper"
# Disable Prompt During Packages Installation
ARG DEBIAN_FRONTEND=noninteractive
# Linux essentials
RUN apt update -y
RUN apt install -y wget

WORKDIR /usr/local
# Install prerequisites
# Latex
RUN apt-get install -y texlive texlive-latex-extra
# Pandoc
ENV PANDOC_DOWNLOAD="./pandoc-install.deb"
RUN wget "https://github.com/jgm/pandoc/releases/download/2.14.0.1/pandoc-2.14.0.1-1-${ARCHITECTURE}.deb" -O ${PANDOC_DOWNLOAD}
RUN dpkg -i ${PANDOC_DOWNLOAD}

# Link local files to the container
VOLUME ${WORK_DIRECTORY}
WORKDIR ${WORK_DIRECTORY}
