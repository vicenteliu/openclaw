# MEMORY.md — Jerry's Long-Term Memory

## Vicente 职业背景

- **目标岗位**: AI Platform Engineer / MLOps (详见 `memory/career-plan-2026.md`)
- **发展方向**: System Engineer → Platform Engineer → AI Platform Engineer
- **学历**: UCI 经济学学士（IT 非科班，2002 年起自学 Linux）
- **当前公司**: ByteDance (2019.06 至今)
  - Contract-to-Hire → Full-Time (2020.03)
  - 湾区第一位 IT，从 0 搭建团队
  - 支持办公室从 ~100 人扩张到 ~1800 人
  - 从全线支持演进到 IT Infra / Systems 方向
  - 关键项目：设备部署系统（Win/Mac/Linux）、Linux 自动化部署+加密合规、BYOD (Workspace ONE/UEM)、内部 AI 实验室
- **前公司**: Mphasis/Varian (2014-2019), Sunteck (更早)
- **认证**: RHCE, CCNP, MCSE, VCP6-DCV, VCP6-NV 等 15 项
- **简历项目**: ~/Workspace/Operation_Undock/
  - `career_background.md` = 母本档案
  - `cv.yaml` = 简历数据（需要根据母本重写）

## 活跃项目

### X 自动发帖 (panda-poster)
- 项目路径：`~/Workspace/panda-poster/`
- GitHub: https://github.com/vicenteliu/panda-poster (public)
- 人设：摸爬滚打的熊猫 (The Struggling Panda)
- 内容：金融知识 + 风险提醒 + 新闻分析（散户视角）
- 状态：✅ 已上线，支持带图发帖
- 用法：`cd ~/Workspace/panda-poster && source .venv/bin/activate && python panda.py post`
- 带图发帖：`PandaPoster().post('内容', image_path='assets/xxx.jpg')`
- **配图工作流** (`IMAGE_GUIDE.md`):
  - 学习帖 → 9:16 四格漫画（情绪线：自信→行动→反转→后悔）
  - 新闻帖 → 9:16 单图插画（夸张/数据/比喻三种类型）
  - 角色：熊猫=散户，狐狸/狼=机构
  - 生成工具：nano-banana-pro (Gemini 3 Pro Image)
- **Git push 注意**: credential helper 会卡住，用 `TOKEN=$(gh auth token) && git push https://vicenteliu:${TOKEN}@github.com/vicenteliu/panda-poster.git main`

### AI 系统初始化工具 (规划中)
- 概念：OS + 小型 AI 模型 = 自主系统初始化
- 技术栈：Docker/Podman + Ollama + nemotron-nano/phi-3
- 目的：求职竞争力 + 开源项目
- 状态：待开发

### Wolf_Fintrack (`~/Workspace/Wolf_Fintrack/`)
- 股票分析工具: 自动数据收集 + Google Sheets 报告
- Docker collector 已上线，18 symbols (Fidelity 持仓 + 贵金属)
- API: Finnhub (quotes/news/SEC) + Alpha Vantage (overview/earnings) + yfinance (补充) + **FinancialDatasets.ai (DCF)**
- **估值模块** (`src/valuation/`): 
  - 成长股: 自动检测 (P/E>30, 收入增长>15%)，用 **PEG ratio** 估值
  - 价值股: 用传统 **DCF** 8 步流程
  - CLI: `docker exec wolf_fintrack_collector python /app/scripts/dcf_valuation.py NVDA SOFI PLTR`
  - 免费 tickers: AAPL, NVDA, MSFT
- Cron: `weekly-dcf-valuation` (每周六 9am)
- docker-compose: collector/ 和 src/ 已挂载为 volume (修改代码只需 restart)

### Risk-First-Protocol (`~/Workspace/Risk-First-Protocol/`)
- LLM 量化交易竞技场：风控优先，多 agent 对比
- Coinbase CDP API (Brokerage v3, Ed25519 JWT)
- Conda 环境: `risk-first-protocol` (Python 3.12)
- Phase 1 完成：交易执行、风控、纸盘、技术指标、回测
- **现货策略**: Trend-Momentum Hybrid (EMA50/200 + RSI + MACD + BB)
- **期货策略**: 海龟交易法 (Donchian 20/15 + ATR 止损 + 双向)
- Cron 每 1 小时现货扫描，每 2 小时期货扫描
- Polymarket 客户端: `src/data/polymarket.py` (只读 Gamma + CLOB)
- **当前状态: LIVE TRADING**
- **期货账户**: $700 可用保证金，BTC/ETH PERP 已激活
  - 产品: BIP-20DEC30-CDE (BTC), ETP-20DEC30-CDE (ETH)
  - 合约大小: 0.01 BTC / 0.1 ETH
  - 杠杆: ~10x 日内，~4x 隔夜
- **期货交易规则**:
  - 单笔风险 ≤5%，最大 2 合约
  - 做多: 上升趋势 + 20日高点突破
  - 做空: 下降趋势 + 20日低点突破
  - 止损: 2×ATR
- **股票估值联动**: `src/data/stock_valuation.py` 集成 Wolf_Fintrack PEG/DCF
  - 成长股用 PEG，价值股用 DCF

### Novel-to-Audio (`~/Workspace/novel-to-audio/`)
- 小说→有声剧 pipeline: Grok 预处理 → 剧本 JSON → Qwen3-TTS
- 两阶段 prompt: prompt0 (清理+标记) → prompt1 (多角色剧本)
- 待办: Qwen3-TTS 集成 (等 ComfyUI 环境)

### Project Pretender（中产润出信息服务）
- 项目路径：`memory/project-pretender.md`
- 定位：中产润出信息服务商，卖信息差，匿名运营
- 研究资料：`memory/research-emigration-guide-2026.md`（8国对比+诈骗分析）
- 渠道：Telegram 频道（主）+ X 小号（引流）
- 状态：规划中，待购买预付费 SIM 卡
- ⚠️ 高保密：不关联 Vicente 真实身份

### 副业/被动收入规划
- 详细研究: `memory/research-side-hustle-passive-income-2025.md`
- 推荐 3+1 飞轮: Risk-First 商业化 + AI 课程 + X 品牌 + 投资组合
- Android 控制/社交监控: 规划中 (ADB 方案)
- 注意: 查 ByteDance 合同 moonlighting 条款

## 投资账户

### Robinhood（成长型）
- **策略**: 长期成长，追求高回报，愿意承担波动
- **年度目标**: $1,800 → $5,000-8,000
- **详细计划**: `memory/robinhood-plan-2026-02.md`
- **当前持仓** (2026-02-10):
  - NVDA $450 (待成交)
  - SOFI $200 (待成交)
  - 现金 $350 (待 PLTR/TQQQ)
- **待执行**: $800 到账后买 PLTR ($360) + TQQQ ($360)

### Fidelity（稳健型）
- **策略**: 稳健为主，按现有机会操作
- **详细计划**: `memory/investment-plan-2026-02.md`
- **短线持仓**: NVO $300 (成本 >$49.12，目标 $52-55)
- **Phase 2 已完成**: SCHD/XLV/BND 配置
- **Phase 3 待执行**: 减持 SMH，择机操作

### Coinbase（加密货币）
- **项目**: Risk-First-Protocol 自动交易
- **余额**: ~$1,906
- **策略**: Trend-Momentum Hybrid，自动执行 BTC/ETH

## OpenClaw 配置

- **诞生日**: 2026-01-29
- **Primary model**: anthropic/claude-opus-4-6 (alias: opus)
- **唯一有效 Anthropic key**: anthropic:paygo (sk-ant-api03-)，按量计费
  - ❌ anthropic:default / anthropic:manual (sk-ant-oat01-) — Anthropic 已封禁第三方工具使用订阅账号 OAuth token (2026-02-20)
  - ❌ Google Antigravity 已禁用 (2026-02-18, OAuth 过期不再维护)
  - **Auth order 已锁定为 paygo only**，不再尝试 oat01 fallback
  - 一个月后评估是否升级到 $200/mo API 套餐
- **Telegram bots**:
  - `default`: @Jerry_molt_bot — 主 bot，日常对话
  - `risk-first`: @risk_first_bot — 加密货币市场扫描
  - `wolf-fintrack`: @wolf_fintrack_bot — 股票市场信息 (2026-02-13 新增)
- **Mac Studio**: M2 Max / 64GB
- **Ollama**: nemotron-3-nano (alias: nano, 手动可切, 必须 reasoning: false)
- **GOOGLE_API_KEY**: 已配置 (env.vars)
- **工作目录限制**: ~/Workspace/ 和 /Users/vicenteliu/openclaw
