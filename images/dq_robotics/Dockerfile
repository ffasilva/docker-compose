FROM ghcr.io/ffasilva/qt_creator:09_11_2026_18_46_18
ENV BASH_ENV="/etc/bash_env"

# Update and clean
RUN apt-get update -q \
    && apt-get autoremove -y \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# Copy DQ Robotics install script and install it
RUN mkdir -p ~/install/dq_robotics
COPY ./scripts/install_dqrobotics_ubuntu24.sh root/install/dq_robotics/
RUN cd ~/install/dq_robotics  \
    && chmod +x install_dqrobotics_ubuntu24.sh  \
    && ./install_dqrobotics_ubuntu24.sh