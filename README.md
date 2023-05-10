# Yehan Repo Sync

>Synchronize the current GitHub repository to the specified repository.

## Usage

```
# File: .github/workflows/repo-sync.yml

name: "Repo Sync"
on:
  push:
jobs:
  repo-sync:
    runs-on: ubuntu-latest
    steps:
    - name: repo-sync
      uses: yehan68/yehan-repo-sync@v2
      with:
        source_repo_url: git@github.com:${{ github.repository }}.git
        destination_repo_url: git@gitee.com:yehan68/repo-sync.git
        ssh_private_key: ${{ secrets.SSH_PRIVATE_KEY }}
```

### Parameter Description

```
source_repo_url: 需要同步的仓库地址
source_branch: 需要同步的仓库分支
destination_repo_url: 目标仓库地址
destination_branch: 目标仓库分支
ssh_private_key: 将本地 .ssh 文件夹中的 id_rsa 添加到仓库的secret中（同时需要将对应的 id_rsa.pub 添加到目标 git 仓库的 ssh keys 中）
```

## Author

[Ye Han](https://github.com/yehan-coding) _zhangtong.mr@aliyun.com_

## License

[MIT](https://github.com/yehan-coding/yehan-git-sync/blob/master/LICENSE)
