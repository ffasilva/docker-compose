FROM ubuntu:24.04
ENV BASH_ENV="/etc/bash_env"

# Update apt-get
RUN apt-get update -q \
    && apt-get autoremove -y \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# Copy QT Creator install script and install QT Creator
RUN mkdir -p ~/install/qt_creator
COPY ./scripts/install_qtcreator_ubuntu24.sh root/install/qt_creator/
RUN cd ~/install/qt_creator  \
    && chmod +x install_qtcreator_ubuntu24.sh  \
    && ./install_qtcreator_ubuntu24.sh