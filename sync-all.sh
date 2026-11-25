#!/usr/bin/env bash
set -euo pipefail

if [ $# -lt 1 ]; then
    echo "用法: ./sync-all.sh \"你的 commit 訊息\""
    exit 1
fi

MESSAGE="$1"

echo "=== 開始同步 AIOT_DIC4 到 GitHub 與 Overleaf ==="

echo "[1/4] git add ."
git add .

echo "[2/4] git commit -m \"$MESSAGE\""
git commit -m "$MESSAGE" || true

echo "[3/4] git push origin master"
git push origin master

echo "[4/4] olcli push main2.tex -> Overleaf"
olcli push main2.tex --project 6b06bc71056e29946462642e

echo "=== 同步完成：GitHub 與 Overleaf 已更新 ==="