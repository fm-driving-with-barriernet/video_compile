#!/bin/bash

# Check if two arguments are provided
if [ "$#" -ne 2 ]; then
  echo "Usage: $0 FOLDER_PATH OUTPUT_VIDEO_PATH"
  exit 1
fi

folder_path=$1
output_video_path=$2

# Run the Python script with the provided arguments
python compiler.py --folder_path="$folder_path" --output_video_path="$output_video_path"

# Check if the video was successfully created before deleting images
if [ -f "$output_video_path" ]; then
    echo "Video created successfully, deleting images..."
    rm -f "$folder_path"/*.jpg
    echo "Images deleted."
else
    echo "Video creation failed. Images not deleted."
fi

# use: ./make_video.sh /path/to/image/folder /path/to/output/video.mp4
# setup: chmod +x make_video.sh 