#!/bin/bash

# === Configuration ===
PROJECT_PATH="../../HeavyMetalBandsApi/HeavyMetalBandsApi.csproj"
CONFIGURATION="Release"
OUTPUT_DIR="./publish"
ZIP_NAME="publish_output.zip"



echo "Deleting old zip file"
[ -f $ZIP_NAME ] && rm $ZIP_NAME

echo "Delete /publish directory contents"
if [ -d "$OUTPUT_DIR" ]; then
    rm -rf "$OUTPUT_DIR"/*
else
    mkdir -p "$OUTPUT_DIR"
fi


# === Publish .NET project ===
echo "Publishing .NET project..."
dotnet publish "$PROJECT_PATH" -c $CONFIGURATION -o $OUTPUT_DIR

# Check if publish succeeded
if [ $? -ne 0 ]; then
  echo "Publish failed. Aborting."
  exit 1
fi

# === Zip the published output ===
echo "Zipping published output..."
rm -f $ZIP_NAME
zip -r $ZIP_NAME $OUTPUT_DIR
