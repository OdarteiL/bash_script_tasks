#!/bin/bash

# This script asks users what they want to do
echo "Do you want to (e)ncrypt or (d)ecrypt a file?"
read action

# Then it asks for file and password
read -p "Enter filename: " file
read -sp "Enter password: " pass
echo ""

if [[ "$action" == "e" ]]; then
    # This encrypt using openssl
    openssl enc -aes-256-cbc -salt -in "$file" -out "$file.enc" -k "$pass"
    echo "File encrypted as $file.enc"
elif [[ "$action" == "d" ]]; then
    # Decrypt
    openssl enc -d -aes-256-cbc -in "$file" -out "${file%.enc}.dec" -k "$pass"
    echo "File decrypted as ${file%.enc}.dec"
else
    echo "Invalid option selected. Please choose 'e' to encrypt or 'd' to decrypt."
fi
