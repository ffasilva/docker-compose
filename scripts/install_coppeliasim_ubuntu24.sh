#!/bin/bash

# Based on https://github.com/juanjqo/docker-coppeliasim/blob//e84797a45d40ff429abe6b0f71c490498a8f4e7e/scripts/setup_coppeliasim.sh

# ${COPPELIASIM_FILE}, ${COPPELIASIM_RELEASE}, and ${UBUNTU_VERSION} variables are set in /images/coppeliasim/Dockerfile
# This scipt sets ${COPPELIASIM_PATH}, which is used in a /images/coppeliasim/compose.yml to know where to find ./coppeliaSim.sh 

# Install dependencies
apt-get update
apt-get install -y --no-install-recommends \
    curl tar xz-utils \
    libx11-6 libxcb1 libxau6 libgl1-mesa-dev \
    xvfb dbus-x11 x11-utils libxkbcommon-x11-0 \
    libavcodec-dev libavformat-dev libswscale-dev \
    python3 python3-pip python3-venv libraw1394-11 libmpfr6 \
    libusb-1.0-0

# Clean unnused apt packages
apt-get autoremove -y
apt-get clean
rm -rf /var/lib/apt/lists/*

# Download CoppeliaSim
echo "Downloading ${COPPELIASIM_FILE}."

mkdir -p ~/Downloads
cd ~/Downloads && curl --progress-bar --remote-name --location \
	https://downloads.coppeliarobotics.com/"${COPPELIASIM_RELEASE}"/"${COPPELIASIM_FILE}" || exit 1

# Extract CoppeliaSim
echo "Extracting ${COPPELIASIM_FILE}."

tar -xf "${COPPELIASIM_FILE}"

# Remove downloaded .tar.xz file
rm "${COPPELIASIM_FILE}"

# Setup CoppeliaSim path
echo "Exporting COPPELIASIM_PATH to ${COPPELIASIM_FILE}."

COPPELIASIM_PATH="${HOME}/Downloads/CoppeliaSim_Edu_${COPPELIASIM_RELEASE}_${UBUNTU_VERSION}"
echo "export COPPELIASIM_PATH=${COPPELIASIM_PATH}" \
	>> /etc/bash_env