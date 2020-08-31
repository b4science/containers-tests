#!/bin/sh
echo "request: $@"
if [ "$1" != "preprocess" ]; then
    echo "failed"
    exit 1
fi

echo config
CONFIG_DIR="/config/rclone"
mkdir -p $CONFIG_DIR
CONFIG_FILE="$CONFIG_DIR/rclone.conf"
echo "[${RCLONE_CONFIG_NAME}]" > $CONFIG_FILE
echo "type = s3" >> $CONFIG_FILE
# TODO: provider as a variable
echo "provider = DigitalOcean" >> $CONFIG_FILE
echo "env_auth = true" >> $CONFIG_FILE
# TODO: fix also the prefix here based on provider
echo "endpoint = ${AWS_DEFAULT_REGION}.digitaloceanspaces.com" >> $CONFIG_FILE
echo "acl = authenticated-read" >> $CONFIG_FILE

echo "Dir: $(pwd)"
SAMPLES_DIR="samples"
mkdir -p $SAMPLES_DIR
# FILE_PATH="${RCLONE_CONFIG_NAME}:${AWS_BUCKET_NAME}/${SAMPLES_DIR}/$2"
FILE_PATH="${RCLONE_CONFIG_NAME}:${AWS_BUCKET_NAME}/$2"
echo "Cloud file: $FILE_PATH"

## what if file already exists locally?
#pass

## CHECK: wait for file to be there
while [ $(rclone ls $FILE_PATH | wc -l) -eq 0 ]
do
    echo sleep
    sleep 5
done

## COPY
com="rclone copy $FILE_PATH $SAMPLES_DIR/"
echo -e "command:\n\$ $com"
# echo "command:\n\$ $com"
eval $com
exit 0
