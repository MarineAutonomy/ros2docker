FROM osrf/ros:humble-desktop-full

LABEL maintainer="VVD"
LABEL version="1.0"
LABEL description="Docker environment for ROS2 implementation on Matsya"

RUN apt-get update
RUN apt-get -y install python3-pip
RUN pip install setuptools==58.2.0
RUN apt install ros-humble-joint-state-publisher-gui
# RUN apt-get update

ENV USERNAME docker
RUN useradd -m $USERNAME && \
       echo "$USERNAME:$USERNAME" | chpasswd && \
       usermod --shell /bin/bash $USERNAME && \
       usermod -aG sudo $USERNAME && \
       usermod -a -G dialout $USERNAME && \
       echo "$USERNAME ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers.d/$USERNAME && \
       chmod 0440 /etc/sudoers.d/$USERNAME 

WORKDIR /home/docker
USER docker

RUN echo "source /opt/ros/humble/setup.bash" >> ~/.bashrc
RUN echo "source ./install/local_setup.bash" >> ~/.bashrc
RUN echo "export ROS_DOMAIN_ID=79" >> ~/.bashrc
RUN echo "source /usr/share/colcon_cd/function/colcon_cd.sh" >> ~/.bashrc
RUN echo "source /usr/share/colcon_argcomplete/hook/colcon-argcomplete.bash" >> ~/.bashrc

CMD ["bash"]
