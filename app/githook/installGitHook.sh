#!/usr/bin/env bash

gitHookPath='.git/hooks/commit-msg'

# 获取当前脚本所在的父目录，即githook
rootPath=$(cd `dirname $0`;pwd)

cd "$rootPath"
cd ..
cd ..
# 将目录定向到根目录下，即GitHooksDemo
rootPath=`pwd`

if [ ! -d ".git/hooks" ]; then
    mkdir .git/hooks
fi

# 判断原来的bash脚本是否存在，如果存在无需复制一遍
# 如果不需要实时更新，把If条件加上即可.
#if [ ! -f "$gitHookPath" ]; then
    # 复制当前脚本到git-hooks目录下
    cp ${rootPath}/app/githook/pre_commit.sh '.git/hooks/commit-msg'
    # 修改权限
    chmod a+x '.git/hooks/commit-msg'
#fi
exit 0