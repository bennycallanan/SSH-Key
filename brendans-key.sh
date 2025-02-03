#!/bin/bash

SSH_KEY="ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQDXw6U3eMWC/ObDHO+huH9U/5qpJMjuOxVLvI5rx/Zo6ewC+FHPXgx027sGVnDsV5aY5Jmt2MpvNM7LI2o4QI8OiFz5Nllppu0Sic75Q3hIScX77vfUZRwzRnLCLnwDv8RQh15fWFgYEto3HzOBpJ9s6xU2lHFPELFnklTy/Sp/1xmVQH5Xt5FVVHEE8BXxQ9L2Z+heA5mf+IWmREMCFcZLaY3PI3pyrEGPnryWyVoJJXasQYYNUg81JxIWGXuwqlJhIpnIbQISkNpCawSV8uJWVp2V5LCVFtj4f3y9j4clgw9B0TK8RPwj6jjMgI4DbPWli2d4wxFTkSdGoCLUqryg5T5J/TfO5hnJIPThxg5GbIGrBTfHrDu0YW1+ZMQmf6xyf4dbxPtKwCab7r1tUjvpT1TR4FjjMihsLfQBAMTH2L1UQBDtVRuddYosTF5xmaZZTYqcA2WPV3TtwACI/tpgfOVOqHtrBOgLHw3JrSRFY1gezo+t/OHv4lbI3cz/+50= brendan@conaxgames"

welcome() {
    echo "

╭━━╮╭━━━┳━━━┳━╮╱╭┳━━━┳━━━┳━╮╱╭┳━━━╮╱╱╭━━━┳━━━┳╮╱╭╮╱╱╭╮╭━┳━━━┳╮╱╱╭╮
┃╭╮┃┃╭━╮┃╭━━┫┃╰╮┃┣╮╭╮┃╭━╮┃┃╰╮┃┃╭━╮┃╱╱┃╭━╮┃╭━╮┃┃╱┃┃╱╱┃┃┃╭┫╭━━┫╰╮╭╯┃
┃╰╯╰┫╰━╯┃╰━━┫╭╮╰╯┃┃┃┃┃┃╱┃┃╭╮╰╯┃╰━━╮╱╱┃╰━━┫╰━━┫╰━╯┃╱╱┃╰╯╯┃╰━━╋╮╰╯╭╯
┃╭━╮┃╭╮╭┫╭━━┫┃╰╮┃┃┃┃┃┃╰━╯┃┃╰╮┃┣━━╮┣━━╋━━╮┣━━╮┃╭━╮┣━━┫╭╮┃┃╭━━╯╰╮╭╯
┃╰━╯┃┃┃╰┫╰━━┫┃╱┃┃┣╯╰╯┃╭━╮┃┃╱┃┃┃╰━╯┣━━┫╰━╯┃╰━╯┃┃╱┃┣━━┫┃┃╰┫╰━━╮╱┃┃
╰━━━┻╯╰━┻━━━┻╯╱╰━┻━━━┻╯╱╰┻╯╱╰━┻━━━╯╱╱╰━━━┻━━━┻╯╱╰╯╱╱╰╯╰━┻━━━╯╱╰╯

"
    echo "Welcome to my script. This script installs and uninstalls my SSH key."
    echo "You should only run this script when you need to give me access to your server."
    echo "As soon as I am finished working on your server, you should uninstall the key."
    echo "THIS SCRIPT AFFECTS ONLY THE LOGGED-IN USER."
}

installkey() {
    mkdir -p ~/.ssh
    touch ~/.ssh/authorized_keys

    if grep -qxF "$SSH_KEY" ~/.ssh/authorized_keys; then
        echo "ERROR: Key is already installed."
    else
        echo "$SSH_KEY" >> ~/.ssh/authorized_keys
        echo "Key successfully installed."
    fi
}

removekey() {
    if grep -qxF "$SSH_KEY" ~/.ssh/authorized_keys; then
        sed -i "\|$SSH_KEY|d" ~/.ssh/authorized_keys
        echo "Key successfully removed."
    else
        echo "ERROR: Key not installed."
    fi
}

options() {
    echo ""
    echo "Please select from one of the following options:"
    echo "1) Install key"
    echo "2) Remove key"
    echo "3) Exit"

    read -p "Enter your choice: " option
}

main() {
    welcome

    while true; do
        options
        case $option in
            1)  installkey ;;
            2)  removekey ;;
            3)  echo "Exiting..."; exit 0 ;;
            *)  echo "Invalid choice, please try again." ;;
        esac
    done
}

main
