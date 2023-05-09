#!/bin/sh

set -e

if [ -z "$SSH_PRIVATE_KEY" ]
  echo "ERROR: SSH_PRIVATE_KEY not set. Exiting..."
  exit 1
fi

echo "$SSH_PRIVATE_KEY" > /root/.ssh/id_rsa
chmod 600 /root/.ssh/id_rsa
chmod +x /syno-repo.sh

sh -c "/syno-repo.sh $*"
