#!/bin/bash

SSH_KEY="ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDRQYXQWmJ8L5Y5S+GXvwxuzIifB8fquBVMli4tvJl58KDqWYq1YpMyMQuFEvhKC8WwUuNPLZSeMWlgY7rrqf/8Wj4Ra2EUwLmaYNTjnCK4mPQLIJYjmk32WAitzn3E9wBB80Udr5F2fNdQO0E7vBOejiS9tKncVjsMTQvFYlbVDt4+Un8xyJInWyXrdOoj9dZoskdLMjGFAONogmKiLQnviCB+p6Su9hQnwLkRUBXl57Nlybwtf6w+7sGjeDh+KKmx3Myse3G+2+bKIpnJvfGjtXbp8oudBQK40GCSOnYm8Pd5SJb+G4vDqL1779O/INMLxg54O2Ogy+DpftAUU99r brendan@conaxgames.com"

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
