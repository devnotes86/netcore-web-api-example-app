#!/bin/bash

# === Configuration ===


ZIP_NAME="publish_output.zip"



# Remote VM config
REMOTE_USER="root"
REMOTE_HOST=${1}
REMOTE_PATH="/home/deployments"


# === Send the ZIP via SCP ===
echo "Sending $ZIP_NAME to $REMOTE_USER@$REMOTE_HOST:$REMOTE_PATH"
scp $ZIP_NAME $REMOTE_USER@$REMOTE_HOST:$REMOTE_PATH


echo "Running finish_deploy.sh on the destination VM" 
ssh $REMOTE_USER@$REMOTE_HOST 'bash /home/deployments/finish_deploy.sh'


# === Done ===
echo "Deployment complete for ${REMOTE_HOST}"



