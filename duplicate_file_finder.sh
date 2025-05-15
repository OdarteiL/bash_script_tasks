#!/bin/bash


# This function displays usage instructions.
display_usage() {
    echo "Usage: $0 /path/to/folder"
    echo "This script identifies duplicate files by content."
}

# This validates the number of arguments provided.
if [ "$#" -ne 1 ]; then
    echo "Error: Invalid number of arguments."
    display_usage
    exit 1
fi

# This gets and validates the input folder
destination_folder=$(realpath "$1")

if [ ! -d "$destination_folder" ]; then
    echo "Error: '$destination_folder' is not a valid directory."
    exit 1
fi

# This prepares temporary storage for file hashes.
declare -A file_hash_map
duplicate_list=()

# This scans files and compute hashes to identify duplicates.
while IFS= read -r -d '' file; do
    if [ -f "$file" ]; then
        hash=$(sha256sum "$file" | awk '{ print $1 }')

        if [[ -n "${file_hash_map[$hash]}" ]]; then
            duplicate_list+=("$file")
        else
            file_hash_map[$hash]="$file"
        fi
    fi
done < <(find "$destination_folder" -type f -print0)

# This step display duplicates found
if [ ${#duplicate_list[@]} -eq 0 ]; then
    echo "✅ Great! no duplicate files found in: $destination_folder"
    exit 0
fi

echo "🔁 Ooops! duplicate files found:"
for dup in "${duplicate_list[@]}"; do
    echo "$dup"
done

# This step asks users what to do 
echo
read -p "Do you want to delete (d) or move (m) duplicates? (d/m/skip): " action

case "$action" in
    d|D)
        for dup in "${duplicate_list[@]}"; do
            rm "$dup"
            echo "Deleted: $dup"
        done
        ;;
    m|M)
        move_folder="$destination_folder/Duplicates_Moved"
        mkdir -p "$move_folder"
        for dup in "${duplicate_list[@]}"; do
            mv "$dup" "$move_folder/"
            echo "Moved: $dup → $move_folder/"
        done
        ;;
    *)
        echo "Skipped. No changes made."
        ;;
esac

echo "✅ Duplicate handling complete."
