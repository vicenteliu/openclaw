# Projects — 活跃项目

> Split from `MEMORY.md` (2026-02-21)

## X 自动发帖 (panda-poster)
- 代码路径：`~/Workspace/panda-poster/`
- GitHub: https://github.com/vicenteliu/panda-poster (public)
- OpenClaw 项目资产/脚本：`/Users/vicenteliu/openclaw/projects/struggling-panda/`
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

## AI 系统初始化工具 (规划中)
- 概念：OS + 小型 AI 模型 = 自主系统初始化
- 技术栈：Docker/Podman + Ollama + nemotron-nano/phi-3
- 目的：求职竞争力 + 开源项目
- 状态：待开发

## GapBridge
- 定位：项目集合（umbrella）
- 项目根目录：`/Users/vicenteliu/openclaw/projects/GapBridge/`
- 详情：`memory/projects/gapbridge.md`
- 子任务：
  1) `Omnissa_UEM_UAG_Sentinel`（目录：`/Users/vicenteliu/openclaw/projects/GapBridge/Omnissa_UEM_UAG_Sentinel/`；详见 `memory/projects/omnissa-uem-uag-sentinel.md`）
  2) `Edge_Compute_System`（目录：`/Users/vicenteliu/openclaw/projects/GapBridge/Edge_Compute_System/`；详见 `memory/projects/edge-compute-system.md`）

## PACEKEEPER
- 项目路径：`/Users/vicenteliu/openclaw/projects/PACEKEEPER/`
- 详情：`memory/projects/pacekeeper.md`
- 目标：避免“压力→短视→掉队”循环，用可执行系统持续跟上时代
- 方向：ChatGPT Pro 利用率最大化；视频内容生产与增长；分发体系；AI Workspace Kit

## Wolf_Fintrack (`~/Workspace/Wolf_Fintrack/`)
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

## Risk-First-Protocol (`~/Workspace/Risk-First-Protocol/`)
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

## Novel-to-Audio (`~/Workspace/novel-to-audio/`)
- 小说→有声剧 pipeline: Grok 预处理 → 剧本 JSON → Qwen3-TTS
- 两阶段 prompt: prompt0 (清理+标记) → prompt1 (多角色剧本)
- 待办: Qwen3-TTS 集成 (等 ComfyUI 环境)

## Project Pretender（中产润出信息服务）
- 项目路径：`memory/project-pretender.md`
- 定位：中产润出信息服务商，卖信息差，匿名运营
- 研究资料：`memory/research-emigration-guide-2026.md`（8国对比+诈骗分析）
- 渠道：Telegram 频道（主）+ X 小号（引流）
- 状态：规划中，待购买预付费 SIM 卡
- ⚠️ 高保密：不关联 Vicente 真实身份

## 副业/被动收入规划
- 详细研究: `memory/research-side-hustle-passive-income-2025.md`
- 推荐 3+1 飞轮: Risk-First 商业化 + AI 课程 + X 品牌 + 投资组合
- Android 控制/社交监控: 规划中 (ADB 方案)
- 注意: 查 ByteDance 合同 moonlighting 条款
