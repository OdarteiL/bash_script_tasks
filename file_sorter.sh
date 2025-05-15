#!/bin/bash

# This script sorts files in a given directory based on their file types.

# This is a function that displays usage instructions.
display_usage() {
    echo "Usage: $0 /path/to/target_folder"
    echo "Organise files into subfolders based on the type."
    echo "Example: $0 /path/to/directory"
}

# This checks if the correct number of arguments is provided
if [ "$#" -ne 1 ]; then
    echo "Error: Invalid number of arguments. Please provide exactly one argument."
    display_usage
    exit 1
fi

# This assigns the input argument to a variable
destination_folder="$1"

# This checks if the provided argument is a valid directory
if [ ! -d "$destination_folder" ]; then
    echo "Error: The provided argument is not a valid directory. Please provide a valid directory."
    display_usage
    exit 1
fi

# ******** Directory Creation ********
# This defines folder names for different file types
documents_folder="$destination_folder/Documents"
images_folder="$destination_folder/Images"
videos_folder="$destination_folder/Videos"
audio_folder="$destination_folder/Audio"
other_folder="$destination_folder/Other"

# This creates the folders if they do not exist
mkdir -p "$documents_folder" "$images_folder" "$videos_folder" "$audio_folder" "$other_folder"

# ************* File sorting starts here *************

# This loops through all files in the destination folder
for filepath in "$destination_folder"/*; do
    # This only processes regular files (ignore directories, links, etc.)
    if [ -f "$filepath" ]; then
        # Extract the base name and extension
        filename=$(basename -- "$filepath")
        extension="${filename##*.}"
        lowercase_ext=$(echo "$extension" | tr '[:upper:]' '[:lower:]')

        # This determines destination based on file extension
        case "$lowercase_ext" in
            txt|pdf|doc|docx)
                destination="$documents_folder"
                ;;
            jpg|jpeg|png|gif|bmp)
                destination="$images_folder"
                ;;
            mp4|mkv|mov|avi)
                destination="$videos_folder"
                ;;
            mp3|wav|flac)
                destination="$audio_folder"
                ;;
            *)
                destination="$other_folder"
                ;;
        esac

        # Move the file to the appropriate folder
        mv "$filepath" "$destination/$filename"
        echo "Moved: $filename → $(basename "$destination")/"
    fi
done
# ************* File sorting ends here *************
echo "Contents of $documents_folder:"
# This displays a message indicating that the sorting is complete
echo "File sorting completed."
# This displays the contents of the destination folder