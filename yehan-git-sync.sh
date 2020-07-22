#!/bin/sh

set -e

SOURCE_REPO_URL=$1
SOURCE_BRANCH=$2
DESTINATION_REPO_URL=$3
DESTINATION_BRANCH=$4

echo "SOURCE=$SOURCE_REPO_URL"
echo "DESTINATION=$DESTINATION_REPO_URL"

git clone "$SOURCE_REPO_URL" /root/source --origin source && cd /root/source
git remote add destination "$DESTINATION_REPO_URL"

# Pull all branches references down locally so subsequent commands can see them
git fetch source '+refs/heads/*:refs/heads/*' --update-head-ok

# Print out all branches
git --no-pager branch -a -vv

git push destination "${SOURCE_BRANCH}:${DESTINATION_BRANCH}" -f
