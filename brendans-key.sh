#!/bin/bash

welcome(){
    echo "
    
╭━━╮╭━━━┳━━━┳━╮╱╭┳━━━┳━━━┳━╮╱╭┳━━━╮╱╱╭━━━┳━━━┳╮╱╭╮╱╱╭╮╭━┳━━━┳╮╱╱╭╮
┃╭╮┃┃╭━╮┃╭━━┫┃╰╮┃┣╮╭╮┃╭━╮┃┃╰╮┃┃╭━╮┃╱╱┃╭━╮┃╭━╮┃┃╱┃┃╱╱┃┃┃╭┫╭━━┫╰╮╭╯┃
┃╰╯╰┫╰━╯┃╰━━┫╭╮╰╯┃┃┃┃┃┃╱┃┃╭╮╰╯┃╰━━╮╱╱┃╰━━┫╰━━┫╰━╯┃╱╱┃╰╯╯┃╰━━╋╮╰╯╭╯
┃╭━╮┃╭╮╭┫╭━━┫┃╰╮┃┃┃┃┃┃╰━╯┃┃╰╮┃┣━━╮┣━━╋━━╮┣━━╮┃╭━╮┣━━┫╭╮┃┃╭━━╯╰╮╭╯
┃╰━╯┃┃┃╰┫╰━━┫┃╱┃┃┣╯╰╯┃╭━╮┃┃╱┃┃┃╰━╯┣━━┫╰━╯┃╰━╯┃┃╱┃┣━━┫┃┃╰┫╰━━╮╱┃┃
╰━━━┻╯╰━┻━━━┻╯╱╰━┻━━━┻╯╱╰┻╯╱╰━┻━━━╯╱╱╰━━━┻━━━┻╯╱╰╯╱╱╰╯╰━┻━━━╯╱╰╯

    "
    echo "Welcome to my script. This script installs and uninstalls my SSH key"
    echo "You should only run this script when you need to give me access to your server"
    echo "As soon as I am finished working on your server you should uninstall the key"
    echo "THIS SCRIPT EFFECTS ONLY THE LOGGED IN USER"
}

break(){
    echo ""
    echo ""
}

options(){
    echo "Please select from one of the following options"
    echo ""
    echo "1| Install key"
    echo "2| Remove key"
    read option
}

installkey(){
    cd
    mkdir -p .ssh
    if grep -q "ssh-rsa AAAAB3NzaC1yc2EAAAABJQAAAQEAgTW2kuI65zA42XAyu/VqWuczbgzdeiTa4ifRJRxI2GBFdI962iHVU0QL7jcCOkIUwhL4KVyIr/xU4rD7NumKpBtvlLAYX3ff75K40yf7BjLS46NSErcMu85ceMmm2gcUVeChj4y4HSvIKvt10XCo9h8EnbIshwz6u953yDad9mDBQkySuSDpNcE4ePeuC5mAMGcwSx4gJt0npYQHe/rrdlIX/5+768qwC9SvSU7vHkADq5xYK8pJhXF8WT8THaEGZH6+nbhpadILDWSbe1D6xtYBqVn4uhQwf7ac9kfFwU+p6yH0AL702u34qR1Zht6g7J0UiU3bbnjE6qjabxEp+w== brendan@conaxgames" ".ssh/authorized_keys" -s ; then
    echo "ERROR: Key is already installed, please contact me if this is not the expected output."
    else 
    echo "ssh-rsa AAAAB3NzaC1yc2EAAAABJQAAAQEAgTW2kuI65zA42XAyu/VqWuczbgzdeiTa4ifRJRxI2GBFdI962iHVU0QL7jcCOkIUwhL4KVyIr/xU4rD7NumKpBtvlLAYX3ff75K40yf7BjLS46NSErcMu85ceMmm2gcUVeChj4y4HSvIKvt10XCo9h8EnbIshwz6u953yDad9mDBQkySuSDpNcE4ePeuC5mAMGcwSx4gJt0npYQHe/rrdlIX/5+768qwC9SvSU7vHkADq5xYK8pJhXF8WT8THaEGZH6+nbhpadILDWSbe1D6xtYBqVn4uhQwf7ac9kfFwU+p6yH0AL702u34qR1Zht6g7J0UiU3bbnjE6qjabxEp+w== brendan@conaxgames" >> ~/.ssh/authorized_keys
    echo "Key sucessfully installed"
    fi
}

removekey(){
    cd
    mkdir -p .ssh
    if grep -q "ssh-rsa AAAAB3NzaC1yc2EAAAABJQAAAQEAgTW2kuI65zA42XAyu/VqWuczbgzdeiTa4ifRJRxI2GBFdI962iHVU0QL7jcCOkIUwhL4KVyIr/xU4rD7NumKpBtvlLAYX3ff75K40yf7BjLS46NSErcMu85ceMmm2gcUVeChj4y4HSvIKvt10XCo9h8EnbIshwz6u953yDad9mDBQkySuSDpNcE4ePeuC5mAMGcwSx4gJt0npYQHe/rrdlIX/5+768qwC9SvSU7vHkADq5xYK8pJhXF8WT8THaEGZH6+nbhpadILDWSbe1D6xtYBqVn4uhQwf7ac9kfFwU+p6yH0AL702u34qR1Zht6g7J0UiU3bbnjE6qjabxEp+w== brendan@conaxgames" ".ssh/authorized_keys" -s ; then
    sed -i '/Brendans Key/d' .ssh/authorized_keys
    echo "Key sucessfully removed"
    else 
    echo "ERROR: Key not installed, please contact me if this is not the expected output."
    fi
}

welcome
break
options
case $option in 
    1)  installkey
    ;;
    2)  removekey
    ;;
    *)  echo "Your selection was not valid. Please try again:"
    options
esac
