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
echo "🔍 检查 libpython3.10.so 是否存在："
LIBPY=$(find /usr/lib -name "libpython3.10.so" 2>/dev/null || true)
if [[ -n "$LIBPY" ]]; then
    echo "✅ 找到: $LIBPY"
else
    echo "❌ 没有找到 libpython3.10.so，请检查安装是否完整"
fi

echo ""
echo "🎯 如果你在用 pyo3，请设置："
echo "    export PYO3_PYTHON=/usr/bin/python3.10"
