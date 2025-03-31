#!/bin/bash
# Original file name
original_file="example.txt"

# Get the current date and time in YYYY-MM-DD_HH-MM-SS format
current_datetime=$(date +"%Y-%m-%d_%H-%M-%S")

# Create the new file name
new_file="${original_file%.*}_$current_datetime.${original_file##*.}"

# Copy the file
cp "$original_file" "$new_file"

echo "File renamed to $new_file"
