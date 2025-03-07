#!/bin/bash

# Check if exactly two arguments are provided
if [[ $# -ne 2 ]]; then
    echo "Usage: $0 <dir> <n>" 1>&2  # Usage message to stderr
    exit 1
fi

# Assign arguments to variables
dir=$1
size=$2

# Use find to locate and remove files larger than specified size
find "$dir" -type f -size +"${size}"c -exec rm {} \;

echo "All files larger than $size bytes have been removed from $dir."
