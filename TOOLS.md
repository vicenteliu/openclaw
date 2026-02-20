# TOOLS.md - Local Notes

## 🤖 Multi-Model Strategy

### Model Inventory
| Model | Access | Best For | Cost |
|-------|--------|----------|------|
| OpenAI Codex (GPT-5.3) | OpenClaw primary | 复杂推理、规划、日常对话 | ChatGPT $200 会员 |
| Gemini 2.5 Pro | `gemini` CLI + OpenClaw fallback | 研究、长文档(1M)、搜索 | $20/mo |
| Gemini 3 Flash | OpenClaw fallback | 快速任务 | 同上 |
| Claude Code | `claude` CLI | 编程、重构、PR review | Anthropic API 按量 |
| Ollama nemotron-3-nano | 本地 | 快速分类、格式转换 | 免费 |

### Dispatch Rules (Jerry 遵守)
- **日常对话/记忆/规划** → OpenAI Codex (Jerry 主脑)
- **Cron 自动任务** → 全部 Gemini
- **编程任务** → Claude Code (后台 PTY)，Codex 作为备选
- **研究/长文档** → `gemini "prompt"` CLI 调用
- **快速本地查询** → `ollama run nemotron-3-nano:latest "prompt"`
- **图片生成** → nano-banana-pro (Gemini API)

### Dispatch Script
`~/openclaw/scripts/ai-dispatch.sh <mode> <prompt>`
- `research` → Gemini 2.5 Pro
- `code` → Claude Code
- `summarize` → Gemini Flash
- `quick` → Ollama gemma3
- `image` → nano-banana-pro

### TTS
- ElevenLabs v3 model
- Voice: "My First Voice" (cloned 女声, ID: RW018aDrAb4nkTTDHMVE)
- 规则: 女声，不自我介绍，直接讲内容

### Dashboard
- URL: http://localhost:8090/live.html
- 更新: `bash ~/openclaw/scripts/update-dashboard.sh`
- Server: `cd ~/openclaw/dashboard && python3 -m http.server 8090 --bind 127.0.0.1`
