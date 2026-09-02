# product-design — B 端产品设计 skill for Codex

一个 [Codex](https://developers.openai.com/codex/) 全局 skill：让 coding agent 设计/构建/评审界面时遵循统一的设计判断。
方法论改编自 Vercel 公开的 [design.md 实践](https://vercel.com/blog/how-our-agents-build-on-brand-pages-with-design-md)
（单色地基 + token 机制层 + 命名反模式 + 反馈闭环），针对 **B 端产品 UI** 重写。

## 双模式

| 任务类型 | 使用规范 |
|---|---|
| **产品 UI**：SaaS Web 后台、内部运营工具、数据密集型管理界面、微信小程序 | 本仓库自撰规范（Geist 单色 token + B2B 界面模式 + 小程序专项 + 34 条反模式） |
| **品牌/报告页**：营销落地页、客户报告、提案、benchmark、ROI 计算器、deck | Vercel 公开发布的品牌页规范（由脚本拉取，不随仓库分发），**品牌署名位留空**，其余全部照用 |

## 目录结构

```
product-design/
├── SKILL.md                          # 核心：适用范围、优先级、四遍工作流、路由表、硬规则、反馈闭环
├── references/
│   ├── visual-system.md              # token 层：Geist 中性灰/语义色/灰阶图表色、字体阶梯、间距圆角、暗色
│   ├── saas-ui.md                    # SaaS Web：应用骨架、列表页、表格、表单、反馈四态、详情页、看板、权限
│   ├── miniprogram.md                # 微信小程序：rpx、胶囊避让、原生组件、安全区、触控目标、性能
│   ├── anti-patterns.md              # 34 条命名反模式（交付前自检清单）
│   └── brand-pages/
│       ├── README.md                 # 品牌页模式说明（含"品牌位留空"适配规则）
│       └── vercel-design.md          # [脚本生成，不入 git] Vercel 规范快照
├── assets/
│   └── vercel-brand.css              # [脚本生成，不入 git] vbg-* token 与组件样式
└── scripts/
    └── fetch-vercel-assets.sh        # 拉取上述两份 Vercel 公开文件
```

## 安装

```bash
# 1. 克隆到 Codex 全局 skills 目录
git clone https://github.com/allanzhang/product-design.git \
  ~/.codex/skills/product-design

# 2. 拉取品牌页模式所需的 Vercel 公开文件（产品 UI 模式不需要）
bash ~/.codex/skills/product-design/scripts/fetch-vercel-assets.sh
```

重启 Codex 会话后，设计/构建/评审界面的任务会自动加载 `SKILL.md`，并按需读取 references。

## 设计体系要点

- **单色地基（Design in monochrome）**：界面 95% 是中性纯灰，色值取自 Vercel Geist token
  （action `#006BFF` / success `#107D32` / warning `#AA4D00` / error `#FC0035`，明暗双值）。
- **颜色只表达状态/操作/数据**，且必须配非颜色线索（图标 + 文字）；价格不染红绿；一屏一个主按钮。
- **图表默认灰阶**、直接标注；分类/标签用中性样式，不为结构导航发明彩色。
- **判断写散文，机制沉 token**：不允许自创字号/色值/间距；机械规则应可被 lint/检查。
- 数字等宽（tabular-nums）；SKU/订单号用等宽字体；表格数字右对齐、满宽。

## 反馈闭环（让规范越用越准）

评审中重复出现的修正，改写成**可观察**的规则（"证据表格占满可用宽度"，而不是"表格别太挤"），
落到最窄的有效层：主观判断 → references 文字；可复用机制 → token/组件；机械可判定 → lint/测试。
可参考 Vercel 公开的两个仓库：[eve-design-template](https://github.com/vercel-labs/eve-design-template)
（组织设计语料的知识契约）与
[design-systems-to-agent-skills](https://github.com/vercel-labs/design-systems-to-agent-skills)
（从真实组件库提取 token/组件事实的流水线）。

## 第三方内容声明

`scripts/fetch-vercel-assets.sh` 拉取的 `design.md` 与 `vercel-brand.css` 版权归 **Vercel** 所有，
从 vercel.com 公开地址直接获取，本仓库不分发这些文件。品牌页模式按 `references/brand-pages/README.md`
的规则省略 Vercel wordmark 与三角 logo。本仓库自撰内容以 MIT 许可发布。
