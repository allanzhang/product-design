# 品牌/报告页模式使用说明（本组织适配规则）

品牌页模式需要 Vercel 公开发布的两份文件。它们是第三方内容（版权归 Vercel），**不随本仓库分发**，
首次使用前运行一次拉取脚本：

```bash
bash scripts/fetch-vercel-assets.sh
```

脚本会生成：

- `references/brand-pages/vercel-design.md` — Vercel 品牌报告页规范（自动附来源/日期头注，不可变快照）
- `assets/vercel-brand.css` — 配套样式表（`vbg-*` token 与组件）

若这两个文件不存在，先运行脚本，勿联网即兴抓取或凭记忆编造其内容。

## 适用任务

营销落地页、客户报告、提案、benchmark、对比页、ROI/性能计算器、演示 deck 等"叙事型/对外表达"页面。
产品 UI（SaaS 后台、内部工具、小程序）不用本模式，走 SKILL.md 的产品规范。

## 适配规则：品牌署名位留空

除品牌署名外，**规范的其余内容全部照用**：Geist 字体、vbg-* token 与组件、信息架构、证据叙事、明暗双主题、
栅格、表格/图表/计算器规则、反模式清单。

唯一改动——不输出任何 Vercel 标志，品牌位留空，等待本组织自有品牌资产：

1. **页眉**：不输出 `<span class="vbg-wordmark">` 及其 `.vbg-identity` 容器；`.vbg-masthead` 中只保留
   `.vbg-document-meta`（客户、周期、用途、密级等真实元数据，句首大写，不得编造）。
2. **页脚**：不输出三角 logo（`.vbg-logo`）；页脚保持安静，右侧至多一行真实的归属/密级信息。
3. 不加载、不引用 Vercel 的 wordmark/triangle SVG 地址；不写 `aria-label="Vercel"`。
4. **禁止替代品**：不要用文字、内联图形、装饰三角、emoji 或临时 logo 填补空位（这也是快照本身的规则）。
   品牌位就是空的，靠留白处理。
5. 元数据中的署名写真实归属（本组织/客户名称）；没有确定归属时留空，不编造。
6. 待本组织自有品牌资产（logo、字标、品牌字体）确定后，在本文件追加"自有品牌壳"替换规则，
   并将对应资产放入 `../../assets/`；在此之前一律留空。

## 用法要点

- 独立 HTML 页面按快照 "Integrate with the caller's project" 一节引入字体和 `assets/vercel-brand.css`，
  但按上述第 1–2 条省略署名元素。
- 快照要求"不要把样式表实现读进上下文"：使用公开的 class/token 名即可，不要打开 CSS 抄内部选择器。
- 交付前按快照 "Inspect and revise privately" 的 8 步顺序自检，自检过程不外露。
