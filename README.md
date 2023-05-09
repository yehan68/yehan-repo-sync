<div align=center>
<img src="https://avatars.githubusercontent.com/u/40497166?s=100" width = "100" height = "100" style="border-radius: 50%;" div align=center />
</div>
<p align="center">
  <a href="https://github.com/yehan-coding/yehan-git-sync">
    <img src="https://img.shields.io/badge/git-sync-orange" alt="git-sync">
  </a>
  <a href="https://github.com/yehan-coding/yehan-git-sync/blob/master/LICENSE">
    <img src="https://img.shields.io/badge/license-MIT-orange" alt="license">
  </a>
</p>

# Yehan Git Sync

用于将当前仓库同步到指定的仓库的 action. 

## Usage

### GitHub Actions
```
# File: .github/workflows/repo-sync.yml

name: "Git Repository Sync"
on:
  push:
jobs:
  repo-sync:
    runs-on: ubuntu-latest
    steps:
    - name: repo-sync
      uses: yehan-coding/yehan-git-sync@v1
      with:
        source_repo_url: git@github.com:${{ github.repository }}.git
        source_branch: master
        destination_repo_url: git@gitee.com:charleszht/test001.git
        destination_branch: master
        ssh_private_key: ${{ secrets.SSH_PRIVATE_KEY }}
```

###  GitHub Actions 参数说明
```
source_repo_url 需要同步的仓库地址

source_branch: 需要同步的仓库分支
destination_repo_url: 目标仓库地址
destination_branch: 目标仓库分支
ssh_private_key: 将本地 .ssh 文件夹中的 id_rsa 添加到仓库的secret中（同时需要将对应的 id_rsa.pub 添加到目标 git 仓库的 ssh keys 中）
```



## Author
[Ye Han](https://github.com/yehan-coding) _zhangtong.mr@aliyun.com_


## License
[MIT](https://github.com/yehan-coding/yehan-git-sync/blob/master/LICENSE)
