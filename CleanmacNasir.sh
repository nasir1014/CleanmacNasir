#!/bin/bash
SCRIPT_DIR=$(cd "$(dirname "$0")" && pwd)
user_paths=(
  "$HOME/Library/Logs"
  "$HOME/Library/Containers"
  "$HOME/Library/Application Support"
  "$HOME/Library/Cookies"
)
system_paths=(
  "/Library/Logs"
  "/Library/Containers"
  "/Library/Application Support"
  "/Library/Cookies"
)

echo "歡迎使用小羊MAC CLEAN 工具！這個工具將會清除以下路徑所有檔案：(Made By Nasir , https://github.com/nasir1014 )"
echo "路徑："
for path in "${user_paths[@]}"; do
    echo " - $path"
done
echo "系統路徑："
for path in "${system_paths[@]}"; do
    echo " - $path"
done
read -p "是否要繼續，數入 [y] 確認:(請注意建議將重要檔案先進行備份ㄛ～不然資料不見了本工具不負責ㄛ) " confirm

if [[ "$confirm" != "y" ]]; then
    echo "哭哭！取消了就無法清理MAC惹ＱＱ"
    exit 0
fi

for path in "${user_paths[@]}"; do
    if [ -d "$path" ]; then
        echo "清理中: $path"
        rm -rf "$path"/*
    else
        echo "路徑不存在: $path"
    fi
done
for path in "${system_paths[@]}"; do
    if [ -d "$path" ]; then
        echo "清理系統中: $path"
        sudo rm -rf "$path"/*
    else
        echo "路徑不存在: $path"
    fi
done

echo "清完嚕～～"
