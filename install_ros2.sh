#!/bin/bash

#! Update and upgrade the system
echo "Updating system..."
sudo apt update && sudo apt upgrade -y
echo "Updating system done!"

#! Set up the locale
echo "Setting up the locale..."
sudo apt install locales -y
sudo locale-gen en_US en_US.UTF-8
sudo update-locale LC_ALL=en_US.UTF-8 LANG=en_US.UTF-8
export LANG=en_US.UTF-8
echo "Setting up the locale done!"

# TODO: Install prerequisites
echo "Installing prerequisites..."
sudo apt install curl gnupg2 lsb-release -y
echo "Installing prerequisites done!"

# TODO: Add the ROS 2 APT repository
echo "Adding ROS 2 repository..."
sudo curl -sSL https://raw.githubusercontent.com/ros/rosdistro/master/ros.asc | sudo apt-key add -
sudo sh -c 'echo "deb [arch=arm64] http://packages.ros.org/ros2/ubuntu $(lsb_release -cs) main" > /etc/apt/sources.list.d/ros2-latest.list'
echo "Adding ROS 2 repository done!"

# TODO: Update package list after adding ROS repository
sudo apt update

# TODO: Install ROS 2 desktop
echo "Installing ROS 2 desktop..."
sudo apt install ros-humble-desktop -y
echo "Installing ROS 2 desktop done!"

# TODO: Source the ROS 2 setup script in .bashrc
echo "Sourcing ROS 2 setup script..."
echo "source /opt/ros/humble/setup.bash" >>~/.bashrc
source ~/.bashrc

# TODO: Install development tools (optional)
echo "Installing development tools (colcon, argcomplete)..."
sudo apt install python3-argcomplete python3-colcon-common-extensions python3-vcstool build-essential -y
echo "Installing development tools done!"

# TODO: Verify installation
echo "Verifying ROS 2 installation..."
ros2 --version
