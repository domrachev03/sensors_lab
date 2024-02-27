FROM ros:noetic
ARG USERNAME=USERNAME
ARG USER_UID=1000
ARG USER_GID=$USER_UID

# Create the user
RUN groupadd --gid $USER_GID $USERNAME \
    && useradd --uid $USER_UID --gid $USER_GID -m $USERNAME \
    && apt-get update \
    && apt-get install -y sudo \
    && echo $USERNAME ALL=\(root\) NOPASSWD:ALL > /etc/sudoers.d/$USERNAME \
    && chmod 0440 /etc/sudoers.d/$USERNAME
RUN apt-get update && apt-get upgrade -y

RUN apt install --no-install-recommends -y \
    git \
    python3-pip \
    python3-catkin-tools \
    ros-noetic-slam-gmapping \
    ros-noetic-navigation \
    ros-noetic-rviz \
    && rm -rf /var/lib/apt/lists/*

ENV SHELL /bin/bash
ENV ROS_WS /ros_ws


RUN mkdir -p $ROS_WS/src 
WORKDIR $ROS_WS 

RUN catkin config \
      --extend /opt/ros/$ROS_DISTRO && \
    catkin build

# source ros package from entrypoint
RUN sed --in-place --expression \
      '$isource "$ROS_WS/devel/setup.bash"' \
      /ros_entrypoint.sh

CMD ["/bin/bash"]