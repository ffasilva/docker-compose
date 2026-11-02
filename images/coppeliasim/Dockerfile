FROM ubuntu:24.04
ENV BASH_ENV="/etc/bash_env"

# Set variables used by /scripts/install_coppeliasim_ubuntu24.sh
ARG COPPELIASIM_RELEASE=V4_10_0_rev0
ENV COPPELIASIM_RELEASE=$COPPELIASIM_RELEASE

ARG UBUNTU_VERSION=Ubuntu24_04
ENV UBUNTU_VERSION=$UBUNTU_VERSION

ARG COPPELIASIM_FILE="CoppeliaSim_Edu_${COPPELIASIM_RELEASE}_${UBUNTU_VERSION}.tar.xz"
ENV COPPELIASIM_FILE=$COPPELIASIM_FILE

# Update apt-get
RUN apt-get update -q \
    && apt-get autoremove -y \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# Copy CoppeliaSim install script and install CoppeliaSim
RUN mkdir -p ~/install/coppeliasim
COPY ./scripts/install_coppeliasim_ubuntu24.sh root/install/coppeliasim/
RUN cd ~/install/coppeliasim  \
    && chmod +x install_coppeliasim_ubuntu24.sh  \
    && ./install_coppeliasim_ubuntu24.sh