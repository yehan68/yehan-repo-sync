#!/bin/sh

# 检查参数
if [ -z "$1" ] || [ -z "$2" ]
  echo "Usage: $0 source_repo_url target_repo_url"
  exit 1
fi

SOURCE_REPO_URL="$1"
DESTINATION_REPO_URL="$2"

# 函数：克隆 Git 仓库
function clone_repo() {
  local repo_url="$1"
  local dir="$2"
  if [ -d "$dir" ]
    echo "Directory $dir already exists, skipping cloning."
    return
  fi
  echo "Cloning repo $repo_url to $dir..."
  git clone "$repo_url" "$dir" --origin source
}

# 函数：推送分支
function push_target() {
  local repo_dir="$1"
  cd "$repo_dir"
  echo "Pushing ..."
  git push destination
}

# 克隆源 Git 仓库
clone_repo "$SOURCE_REPO_URL" "/root/source"

# 添加目标 Git 仓库为远程仓库
cd /root/source
git remote add destination "$DESTINATION_REPO_URL"
git remote update
git fetch destination '+refs/heads/*:refs/heads/*' --update-head-ok

# 打印所有分支信息
git branch -a -v

# 推送源分支到目标分支
push_target "/root/source"
