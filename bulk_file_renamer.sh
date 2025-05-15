#!/bin/bash

# This is a function that displays usage instructions.
display_usage() {
    echo "Usage: $0 /path/to/folder"
    echo "This script renames all files in the folder using a pattern."
}

# This checks if the correct number of arguments is provided
if [ "$#" -ne 1 ]; then
    echo "Error: Invalid number of arguments."
    display_usage
    exit 1
fi

destination_folder="$1"

if [ ! -d "$destination_folder" ]; then
    echo "Error: The specified directory does not exist."
    display_usage
    exit 1
fi

# This gets the user's input for the destination folder

# Prompt for file name prefix
read -p "Enter the prefix to use for renamed files (e.g., project_): " prefix

# Ask whether to include a counter
read -p "Include a counter in the filename? (y/n): " include_counter

# Ask whether to include the current date
read -p "Include today's date in the filename? (y/n): " include_date

# This gets the current date in YYYYMMDD format
today=$(date +"%Y%m%d")

# Initialize counter
counter=1

# This renames files in the specified folder

# Loop through each file in the folder
for file in "$destination_folder"/*; do
    if [ -f "$file" ]; then
        # Get the file extension (e.g., .txt, .jpg)
        extension="${file##*.}"
        base_new_name="$prefix"

        # Append counter if requested
        if [ "$include_counter" == "y" ]; then
            formatted_counter=$(printf "%02d" "$counter")
            base_new_name="${base_new_name}${formatted_counter}_"
        fi

        # Append date if requested
        if [ "$include_date" == "y" ]; then
            base_new_name="${base_new_name}${today}_"
        fi

        # Construct full new filename
        new_filename="${base_new_name}.${extension}"
        new_filepath="$destination_folder/$new_filename"

        # Rename the file
        mv "$file" "$new_filepath"
        echo "Renamed: $(basename "$file") → $(basename "$new_filepath")"

        # Increment counter
        counter=$((counter + 1))
    fi
done

echo "✅ Bulk renaming complete for: $destination_folder"
