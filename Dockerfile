FROM osrf/ros:foxy-desktop

LABEL maintainer="aditya"
LABEL version="1.0"
LABEL description="Docker environment for ROS2"

RUN echo "source /opt/ros/foxy/setup.bash" >> ~/.bashrc

RUN rosdep update

ENV USERNAME docker
RUN useradd -m $USERNAME && \
        echo "$USERNAME:$USERNAME" | chpasswd && \
        usermod --shell /bin/bash $USERNAME && \
        usermod -aG sudo $USERNAME && \
        echo "$USERNAME ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers.d/$USERNAME && \
        chmod 0440 /etc/sudoers.d/$USERNAME 

WORKDIR /home/docker
USER docker

CMD ["source","~/.bashrc"]