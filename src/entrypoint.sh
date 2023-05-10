#!/bin/sh

set -e

if [ -z "$SSH_PRIVATE_KEY" ]; then
  echo "ERROR: SSH_PRIVATE_KEY not set. Exiting..."
  exit 1
fi
mkdir /root/.ssh
echo "$SSH_PRIVATE_KEY" > /root/.ssh/id_rsa
chmod 600 /root/.ssh/id_rsa
chmod +x /src/syno-repo.sh
ls -a

sh -c "/src/syno-repo.sh $*"
