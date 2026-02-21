# OpenClaw — 配置与运行笔记

> Split from `MEMORY.md` (2026-02-21)

- **诞生日**: 2026-01-29
- **当前默认模型**: openai-codex/gpt-5.2
- **Thinking default**: high (`agents.defaults.thinkingDefault`)

## Anthropic（历史/注意事项）
- **唯一有效 Anthropic key**: anthropic:paygo (sk-ant-api03-)，按量计费
  - ❌ anthropic:default / anthropic:manual (sk-ant-oat01-) — Anthropic 已封禁第三方工具使用订阅账号 OAuth token (2026-02-20)
  - ❌ Google Antigravity 已禁用 (2026-02-18, OAuth 过期不再维护)
  - **Auth order 已锁定为 paygo only**，不再尝试 oat01 fallback
  - 一个月后评估是否升级到 $200/mo API 套餐

## Telegram bots
- `default`: @Jerry_molt_bot — 主 bot，日常对话
- `risk-first`: @risk_first_bot — 加密货币市场扫描
- `wolf-fintrack`: @wolf_fintrack_bot — 股票市场信息 (2026-02-13 新增)

## 设备/运行环境
- **Mac Studio**: M2 Max / 64GB
- **Ollama**: nemotron-3-nano (alias: nano, 手动可切, 必须 reasoning: false)
- **GOOGLE_API_KEY**: 已配置 (env.vars)
- **工作目录限制**: ~/Workspace/ 和 /Users/vicenteliu/openclaw
