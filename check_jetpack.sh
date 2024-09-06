#!/bin/bash

# TODO: helper function
#* dpkg -l: list installed packages
#* | (pipe): pass the output of the previous command to the next command
#* grep -q "$1": find matching patern in quiet mode, do not output any matching lines
is_installed() {
    dpkg -l | grep -q "$1"
}

install_jetpack() {
    sudo apt-get update
    sudo apt-get install -y nvidia-l4t-core
    if [ $? -eq 0 ]; then
        echo "JetPack installed successfully!"
    else
        echo "Failed to install JetPack. Please check the error messages above."
        exit 1
    fi
}

# TODO: main function
if is_installed "nvidia-l4t-core"; then
    JETPACK_VERSION=$(dpkg-query --showformat='${Version}' --show nvidia-l4t-core)
    echo "JetPack is already installed. Version: $JETPACK_VERSION"
else
    echo "JetPack is not installed. Installing JetPack..."
    install_jetpack
fi
