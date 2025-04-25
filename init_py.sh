#!/bin/bash

set -e

echo "🔧 添加 deadsnakes PPA..."
sudo apt update
sudo apt install -y software-properties-common
sudo add-apt-repository -y ppa:deadsnakes/ppa

echo "📦 安装 Python 3.10 及开发包..."
sudo apt update
sudo apt install -y python3.10 python3.10-dev python3.10-venv

echo "✅ 安装完成！"
echo ""
echo "👉 Python 版本：$(python3.10 --version)"
echo ""

# 检查是否已经存在符号链接
if [ -f /usr/bin/python3 ]; then
    echo "⚠️ 已经存在 /usr/bin/python3 符号链接，准备删除..."
    sudo rm /usr/bin/python3
else
    echo "🆗 没有找到现有的 /usr/bin/python3 符号链接，继续操作..."
fi

# 创建新的符号链接
echo "🔗 创建新的 Python 3 符号链接..."
sudo ln -s /usr/bin/python3.10 /usr/bin/python3

# 确认符号链接是否正确
python3 --version # 应该输出 Python 3.10

# 检查是否已经安装 pip3
if ! command -v python3.10 -m pip &> /dev/null; then
    echo "📦 pip3 未安装，开始安装..."
    curl -sS https://bootstrap.pypa.io/get-pip.py | python3.10
else
    echo "🆗 pip3 已安装：$(python3.10 -m pip --version)"
fi

# 显示 pip 版本
python3.10 -m pip --version

echo "✅ Python 3.10 和 pip3 安装完成！"
