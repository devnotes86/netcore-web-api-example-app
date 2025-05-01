#!/bin/bash
#i
#
OUTPUT_DIR="/home/deployments/output"
ZIP_FILE="/home/deployments/publish_output.zip"

#
## === Ensure output directory exists ===
mkdir -p $OUTPUT_DIR
#
## === Unzip the publish_output.zip file into the output directory ===
unzip -o $ZIP_FILE -d $OUTPUT_DIR
#
echo "Unzip complete. Contents are in ./output"


# === Copy files to Nginx site directory ===
 TARGET_DIR="/var/www/heavymetalbandsapi/"
 sudo rm -rf "$TARGET_DIR/*"


 sudo mkdir -p "$TARGET_DIR"
 sudo cp -r $OUTPUT_DIR/publish/* "$TARGET_DIR"
 echo "Files copied to $TARGET_DIR"


 # === Delete all files from output directory ===
 rm $ZIP_FILE
 rm -rf $OUTPUT_DIR/*
 echo "Cleaned up output directory."


 sudo systemctl daemon-reexec
 sudo systemctl enable heavymetalbandsapi
 sudo systemctl restart heavymetalbandsapi
 sudo systemctl status heavymetalbandsapi.service
