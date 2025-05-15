#!/bin/bash

# This asks for the two folders to sync
read -p "Enter source folder: " src
read -p "Enter target folder: " tgt

# This will make sure both folders exist
if [[ ! -d "$src" || ! -d "$tgt" ]]; then
    echo "One or both folders do not exist. Please provide valid directories."
    exit 1
fi

# Using the rsync to sync both ways
echo "Syncing $src → $tgt..."
rsync -av --delete "$src/" "$tgt/"

echo "Syncing $tgt → $src..."
rsync -av --delete "$tgt/" "$src/"

echo "Folders synced."
