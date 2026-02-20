# 系统任务与功能清单

> 最后更新: 2026-02-17
> 维护人: Jerry (AI Assistant)

---

## 一、Cron 定时任务

### 📈 市场监控类

| 任务名 | 频率 | 说明 | Bot | 状态 |
|--------|------|------|-----|------|
| `morning-market-brief` | 周一至五 6:15 AM | Wolf_FinTrack 晨间简报 | wolf-fintrack | ✅ |
| `evening-market-recap` | 周一至五 1:15 PM | Wolf_FinTrack 收盘简报 | wolf-fintrack | ✅ |
| `crypto-market-scan` | 每 1 小时 | Risk-First 现货分析 (BTC/ETH/LINK/LTC) | risk-first | ✅ |
| `turtle-futures-trader` | 每 2 小时 | 海龟期货策略 (BTC/ETH PERP) | risk-first | ✅ |
| `altcoin-monitor` | 每小时 :15 | LINK/LTC 持仓监控 | risk-first | ✅ |
| `weekly-dcf-valuation` | 每周六 9:00 AM | DCF 估值 + Google Sheets 同步 | wolf-fintrack | ✅ |

### 🔔 价格警报类

| 任务名 | 频率 | 触发条件 | Bot |
|--------|------|----------|-----|
| `nvda-position-alert` | 周一至五 6:40/10:40/1:40 | >$210 止盈 / <$160 止损 | wolf-fintrack |
| `sofi-position-alert` | 周一至五 6:45/10:45/1:45 | >$26 止盈 / <$18 止损 | wolf-fintrack |
| `pltr-entry-alert` | 周一至五 6:30/10:30/1:30 | <=$135 入场提醒 | wolf-fintrack |
| `nvo-price-alert` | 周一至五 6:30/10:30/1:30 | <=$46.50 买入 / >$52 止盈 | wolf-fintrack |
| `jd-price-alert` | 周一至五 6:35/10:35/1:35 | <=$27.30 买入 / >$30 止盈 | wolf-fintrack |
| `smh-price-alert` | 周一至五 6:30/10:30/1:30 | >=$415 减持提醒 | wolf-fintrack |
| `tqqq-entry-alert` | 周一至五 6:35/10:35/1:35 | QQQ 比 5 日均跌 >2% | wolf-fintrack |

### 📰 X 发帖类

| 任务名 | 频率 | 说明 | 状态 |
|--------|------|------|------|
| `panda-news-digest` | 每天 9:30 AM | 新闻候选筛选 → 发 Telegram 供选择 | ✅ |
| `daily-news-auto-post` | 每天 9:30 AM | 自动发 1 篇新闻 (漫威配图) + 记录 Sheet + 推送备选 | ✅ 新增 |
| `panda-post-005` | 2/18 10:00 AM (一次性) | CVD 背离知识帖 | ⏳ 待执行 |
| `panda-post-006` | 2/19 10:00 AM (一次性) | 流动性收割知识帖 | ⏳ 待执行 |

> ⚠️ 注意: `panda-news-digest` 和 `daily-news-auto-post` 同时在 9:30 AM，功能有重叠。
> 建议：禁用 `panda-news-digest`，由 `daily-news-auto-post` 统一处理（自动发帖 + 备选推送）。

---

## 二、Heartbeat 任务 (~/openclaw/HEARTBEAT.md)

| 任务 | 频率 | 说明 |
|------|------|------|
| Tessera 同步 | 每次 heartbeat | git commit + 复制到 Tessera + push GitHub |
| 状态检查 | 每次 | gateway 状态 + model fallback |
| Anthropic 限流监控 | 每次 | 检查 cooldown，触发则 Telegram 通知 |

---

## 三、Telegram Bots

| Bot | 用途 | 账号 ID |
|-----|------|---------|
| @Jerry_molt_bot | 主 bot，日常对话 | default |
| @risk_first_bot | 加密货币市场扫描/交易 | risk-first |
| @wolf_fintrack_bot | 股票市场信息/简报/警报 | wolf-fintrack |

---

## 四、Docker 服务

| 服务 | 说明 | 状态 |
|------|------|------|
| wolf_fintrack_collector | 股票数据采集 + Google Sheets 同步 | 运行中 |
| wolf_fintrack_postgres | PostgreSQL 数据库 | 运行中 |

---

## 五、Google Sheets (Wolf_FinTrack)

| Tab | 内容 | 更新频率 |
|-----|------|----------|
| Quotes | 最新行情 | 随 collector |
| Ratios | 财务比率 | 随 collector |
| Financials | 财务报表 | 随 collector |
| News | 个股新闻 (100条) | 随 collector |
| DCF Valuation | DCF 估值结果 | 每周六 |
| News Candidates | 每日新闻候选 (中英文) | 每天 9:30 AM |

---

## 六、X 账号 (摸爬滚打的熊猫)

- **发帖工具**: `~/Workspace/panda-poster/` (PandaPoster)
- **内容类型**:
  - 📰 新闻分析 → 漫威配图 (Marvel)
  - 📚 知识分享 → 皮克斯配图 (Pixar)
- **发帖频率**: 每天 2 篇新闻 (1 自动 + 1 手动) + 知识帖不定期
- **配图模板**: `~/Workspace/panda-poster/IMAGE_GUIDE.md`
- **Git push**: 需用 `gh auth token` 避免 credential helper 卡住

---

## 七、投资账户概览

| 账户 | 策略 | 自动化程度 |
|------|------|-----------|
| Robinhood | 成长型 (NVDA/SOFI/PLTR/TQQQ/EWJ + SOFI Call) | 价格警报自动 |
| Fidelity | 稳健型 (NVO/JD/SCHD/XLV/BND/SMH) | 价格警报自动 |
| Coinbase | 加密现货+期货 | 全自动交易 |

---

## 八、待优化事项

1. **`panda-news-digest` 与 `daily-news-auto-post` 重复** — 建议禁用前者
2. **PLTR 入场警报** — PLTR 已买入 ($135)，alert 可能需要更新目标
3. **TQQQ 入场警报** — TQQQ 已下单 ($350)，确认是否还需要
4. **SOFI 期权监控** — 新增 SOFI $20 Call 3/20，需要价格追踪
5. **知识帖排期** — 005 (CVD) 2/18, 006 (流动性收割) 2/19，之后需要新内容
