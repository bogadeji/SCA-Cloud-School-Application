#!/usr/bin/bash

UNAME=$(uname)

if [[ "$UNAME" = "Linux" ]]; then
    DISTRO="$(lsb_release -i | awk -F"\t" '{print $2}')"
    if [[ "$DISTRO" = "Ubuntu" || "$DISTRO" = "Debian" ]]; then
        echo "Refreshing Package Manager"
        apt update
        echo "Installing WGet & Curl"
        apt install -y wget curl
        echo "Installing: NodeJS 15"
        curl -sL https://deb.nodesource.com/setup_15.x | bash -
        apt install -y nodejs
    fi
fi

if [[ ! $? -eq 0 ]]; then
  echo "Installation failed!"
  exit 1
fi