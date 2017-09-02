#!/usr/bin/env bash

regularExpression="^\s?\[(feature|bugfix|refactor|other)\]\s?\[.+\]\s?.+"
error_msg="提交信息首行请按照如下格式书写:\n
[commitType][module] description\n
1. commitType只能是feature（新功能）、bugfix（修复bug）、refactor（重构）、other（其他）
2. module 则为对应的功能模块，如直播、视频、正文、列表等
3. description 没有限制
例：
[feature][列表] 新增头图广告 "

#获取文件首行
firstLine=`head -n1 "$1"`
if [[ "$firstLine" =~ $regularExpression ]]; then
    echo "commit success"
    exit 0
fi
echo "commit fail"
echo "$error_msg" >&2
exit 1
