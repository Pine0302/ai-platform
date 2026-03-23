#!/bin/bash

set -e

REPO_DIR="$HOME/ai-platform"

echo "🚀 Installing AI Platform..."

# 1. clone or update
if [ ! -d "$REPO_DIR" ]; then
  git clone https://github.com/yourname/ai-platform.git "$REPO_DIR"
else
  echo "🔄 Updating repo..."
  cd "$REPO_DIR" && git pull
fi

# 2. 创建目录
mkdir -p ~/.claude
mkdir -p ~/.openclaw

# 3. 软链接 configs
ln -sf "$REPO_DIR/configs/claude-code/config.json" ~/.claude/config.json
ln -sf "$REPO_DIR/configs/openclaw/config.json" ~/.openclaw/config.json

# 4. 环境变量
if [ ! -f ~/.ai-platform.env ]; then
  cp "$REPO_DIR/env/.env.example" ~/.ai-platform.env
  echo "⚠️ 请编辑 ~/.ai-platform.env 填写API Key"
fi

echo "✅ Installation complete!"
