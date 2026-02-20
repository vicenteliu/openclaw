# HEARTBEAT.md

## 定期任务

### 🧩 Tessera 同步 (每次)
检查 ~/openclaw 是否有变更，如有则：
1. `git add -A && git commit` 到本地
2. **安全扫描**: 在复制前运行 `grep -rE 'AIza[A-Za-z0-9_-]{30,}|sk[-_][A-Za-z0-9]{40,}|gh[pousr]_[A-Za-z0-9]{30,}' ~/openclaw/memory/ ~/openclaw/MEMORY.md ~/openclaw/TOOLS.md`
   - 如果发现任何 key/secret → **停止同步**，通知 Vicente，先 redact 再继续
3. 复制到 ~/Workspace/Tessera/openclaw/
4. 提交并推送到 GitHub

### 📊 状态检查 (每次)
- 检查 gateway 状态
- 检查 model fallback 是否正常

### 🔨 Claude Code 任务结果 (每次)
检查 `~/openclaw/data/claude-code-results/latest.json`：
- 如果文件存在且 status=done，读取结果并通知 Vicente
- 通知后将文件重命名为 `latest-YYYYMMDD-HHMMSS.json`（归档）
- 如果不存在，跳过

### ⚠️ Anthropic Paygo 监控 (每次)
注意：anthropic:default 和 anthropic:manual (oat01 OAuth tokens) 已被 Anthropic 封禁（第三方工具不允许用订阅账号），唯一有效是 anthropic:paygo (sk-ant-api03-)。
检查 `~/.openclaw/agents/main/agent/auth-profiles.json` 中 usageStats：
- 如果 `anthropic:paygo` 的 `lastUsed` 在最近 30 分钟内且 errorCount > 0：
  1. 发 Telegram 告警给 Vicente（target: 7696507791, channel: telegram）
- 如果都正常，不需要提醒
