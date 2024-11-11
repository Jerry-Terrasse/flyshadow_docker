#!/bin/bash

DOWNLOAD_URL="https://api.hkspeedup.com/client/file/download/29de51e0-c032-4c9f-b7ce-604afbfeb5e0"

curl -L -o /tmp/flyshadow_router.zip "$DOWNLOAD_URL"

mkdir -p /tmp/flyshadow_extract

unzip /tmp/flyshadow_router.zip -d /tmp/flyshadow_extract

TAR_GZ_FILE=$(find /tmp/flyshadow_extract -name "*.tar.gz" | head -n 1)

if [ -z "$TAR_GZ_FILE" ]; then
  echo "No .tar.gz file found"
  exit 1
fi

tar -xzf "$TAR_GZ_FILE" -C /tmp/flyshadow_extract

cp /tmp/flyshadow_extract/target/x86_64-unknown-linux-musl/release/flyshadow_router /usr/local/bin/

chmod +x /usr/local/bin/flyshadow_router

rm -rf /tmp/flyshadow_router.zip
rm -rf /tmp/flyshadow_extract
