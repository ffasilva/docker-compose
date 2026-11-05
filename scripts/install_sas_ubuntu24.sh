#!/bin/bash

# Dependencies
apt-get update
apt-get install -y git software-properties-common libeigen3-dev python3-pip cmake

# Install sas_core
mkdir -p ~/sas
cd ~/sas
git clone https://github.com/SmartArmStack/sas_core.git --recursive
cd ~/sas/sas_core
mkdir -p build
cd ~/sas/sas_core/build
cmake ..
make
make install

# Install sas_common
cd ~/sas
git clone https://github.com/SmartArmStack/sas_common.git --recursive
cd ~/sas/sas_common
mkdir -p build
cd ~/sas/sas_common/build
cmake ..
make
make install

# Install sas_conversions
cd ~/sas
git https://github.com/SmartArmStack/sas_conversions.git --recursive
cd ~/sas/sas_conversions
mkdir -p build
cd ~/sas/sas_conversions/build
cmake ..
make
make install

# Install sas_msgs
cd ~/sas
git https://github.com/SmartArmStack/sas_msgs.git --recursive
cd ~/sas/sas_msgs
mkdir -p build
cd ~/sas/sas_msgs/build
cmake ..
make
make install

# Install sas_msgs
cd ~/sas
git https://github.com/SmartArmStack/sas_msgs.git --recursive
cd ~/sas/sas_msgs
mkdir -p build
cd ~/sas/sas_msgs/build
cmake ..
make
make install

# Clean apt
apt-get autoremove -y
apt-get clean
rm -rf /var/lib/apt/lists/*