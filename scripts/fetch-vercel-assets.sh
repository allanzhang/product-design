#!/usr/bin/env bash
# 拉取品牌页模式所需的 Vercel 公开文件（本仓库不分发第三方内容）。
# 产物：references/brand-pages/vercel-design.md（自动加来源/日期头注）
#       assets/vercel-brand.css
set -euo pipefail

SKILL_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
SNAP="$SKILL_DIR/references/brand-pages/vercel-design.md"
CSS="$SKILL_DIR/assets/vercel-brand.css"
DATE="$(date +%Y-%m-%d)"

mkdir -p "$SKILL_DIR/references/brand-pages" "$SKILL_DIR/assets"

echo "Fetching vercel.com/design.md ..."
TMP="$(mktemp)"
curl -fsSL --compressed --http1.1 "https://vercel.com/design.md" -o "$TMP"
{
  cat <<BANNER
<!--
第三方内容快照（Third-party snapshot）
来源: https://vercel.com/design.md （design.dark.md 内容相同，暗色由样式表 token 处理）
配套样式表: ../../assets/vercel-brand.css （来源 https://vercel.com/geist/vercel-brand.css）
抓取日期: $DATE （由 scripts/fetch-vercel-assets.sh 生成）
说明: Vercel 公开发布、供 agent 加载的品牌报告页设计规范。本文件为不可变快照，请勿就地修改；
      刷新时重新运行本脚本。该规范产出的是 Vercel 品牌页面；按 brand-pages/README.md 的
      组织适配规则，品牌署名位留空，仅借鉴其方法论与组件体系。
      第三方内容版权归 Vercel 所有，本仓库不分发该文件。
-->

BANNER
  cat "$TMP"
} > "$SNAP"
rm -f "$TMP"

echo "Fetching vercel.com/geist/vercel-brand.css ..."
curl -fsSL --compressed --http1.1 "https://vercel.com/geist/vercel-brand.css" -o "$CSS"

echo "Done:"
echo "  - $SNAP"
echo "  - $CSS"
