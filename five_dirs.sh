#!/bin/bash

# Create main directory
mkdir -p five

# Create 5 directories and 4 files in each
for dir_num in {1..5}; do
    dir="five/dir$dir_num"
    mkdir -p "$dir"

    for file_num in {1..4}; do
        file="$dir/file$file_num"
        # Create file with correct number of lines
        for ((line=1; line<=file_num; line++)); do
            echo $file_num >> "$file"
        done
    done
done

echo "Directories and files created successfully."
