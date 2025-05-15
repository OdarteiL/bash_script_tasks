#!/bin/bash

# This function displays usage instructions.
display_usage() {
    echo "Usage: $0 /path/to/source_folder /path/to/backup_folder"
    echo "This script backs up a folder with optional compression."
}

# This validates the number of arguments provided.
if [ "$#" -ne 2 ]; then
    echo "Error: Invalid number of arguments."
    display_usage
    exit 1
fi

source_folder=$(realpath "$1")
backup_root=$(realpath "$2")

if [ ! -d "$source_folder" ]; then
    echo "Error: Source folder does not exist. Please provide a valid source folder."
    exit 1
fi

mkdir -p "$backup_root"

# This step then asks users for backup preferences 
echo "What type of backup would you like to perform?"
echo "1) Full Backup"
echo "2) Incremental (only changed files)"
read -p "Enter choice [1/2]: " backup_type

read -p "Would you like to compress the backup? (y/n): " compress_choice

# This step prepares backup folder 
timestamp=$(date +"%Y%m%d_%H%M%S")
backup_folder="$backup_root/backup_$timestamp"

mkdir -p "$backup_folder"

# In this step we perform the Backup 
echo "Backing up files from: $source_folder"
echo "Backup destination: $backup_folder"

if [ "$backup_type" == "2" ]; then
    echo "Performing incremental backup..."
    rsync -av --update "$source_folder"/ "$backup_folder"/
else
    echo "Performing full backup..."
    cp -r "$source_folder"/ "$backup_folder"/
fi

# This stage provides optional compression
if [ "$compress_choice" == "y" ]; then
    compressed_file="$backup_folder.tar.gz"
    echo "Compressing backup into: $compressed_file"
    tar -czf "$compressed_file" -C "$backup_root" "$(basename "$backup_folder")"
    rm -rf "$backup_folder"
    echo "Compression complete."
fi

# Completion message 
echo "✅ Backup completed successfully."
