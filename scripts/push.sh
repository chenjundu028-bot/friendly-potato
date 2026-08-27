#!/usr/bin/env bash
# 示例脚本:推送到 main。
# 令牌从环境变量 GH_TOKEN 读取,绝不写入仓库,避免泄露。
# 用法:
#   GH_TOKEN=<你的token> ./push.sh
# 注意:推送到 github.com 使用 gh-proxy.com 代理(与仓库克隆地址一致)。
set -euo pipefail

: "${GH_TOKEN:?请先设置环境变量 GH_TOKEN,例如: GH_TOKEN=<你的token> ./push.sh}"

REMOTE="https://chenjundu028-bot:${GH_TOKEN}@gh-proxy.com/https://github.com/chenjundu028-bot/friendly-potato.git"

echo "正在推送到 main ..."
git push "$REMOTE" main
echo "完成。"
