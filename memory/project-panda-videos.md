# Panda Videos — Remotion 投资短视频项目

## 概述
用 Remotion (React → MP4) + ElevenLabs TTS 程序化生成投资分析短视频，发 X。
解决痛点：不需要手动剪辑，不需要找素材，数据即内容。

## 项目路径
`~/Workspace/panda-videos/`

## 技术栈
- **Remotion** 4.x — React 写视频，代码即模板
- **Remotion Skills** — AI agent 可用自然语言生成视频代码
- **ElevenLabs** — v3 模型 + "My First Voice" (女声 cloned, ID: RW018aDrAb4nkTTDHMVE)
  - 不自我介绍，直接讲内容
  - TTS 脚本: `scripts/tts.py`
- **数据源**: Wolf_Fintrack (股票) / Risk-First-Protocol (加密)
- **渲染**: 本地 Mac Studio M2 Max

## 状态: ✅ Pipeline 端到端跑通
- HelloWorld + PortfolioRanking 两个 compositions
- Skills 已安装
- WolfAI logo (wolf-original.jpg, rembg AI去背) 作为水印 — 定稿版
- 品牌元素：左上+右下 WolfAI logo + "wolfai.me"，底部 "The Struggling Panda"
- 水印始终显示，60% 透明度
- 9:16 竖版 (1080x1920), 30fps, 15秒

## 成本
- Remotion 个人免费
- ElevenLabs 已有
- 渲染本地 $0

## Pipeline（已实现）
- 入口: `cd ~/Workspace/panda-videos && python3 scripts/pipeline.py`
- 数据: Wolf_Fintrack PostgreSQL (docker exec wolf_fintrack_db)
- 持仓: scripts/pipeline.py 中 HOLDINGS dict (Fidelity 实际持仓)
- TTS: scripts/tts.py (ElevenLabs v3 + My First Voice)
- 渲染: npx remotion render PortfolioRanking
- 输出: out/portfolio-YYYYMMDD.mp4 (9:16, 15秒, ~1.2MB)
- 首次成功: 2026-02-18

## Pipeline 架构
```
Wolf_Fintrack/Risk-First 数据
    → Remotion React 模板（图表动画+文字）
    → ElevenLabs 生成旁白音频
    → Remotion 合成 MP4
    → panda-poster 发 X
```

## 视频类型规划
1. 📊 每周持仓涨跌排行动画
2. 📈 个股估值可视化 (DCF/PEG)
3. 🐼 散户知识帖视频版（现有文字帖 → 带动画短视频）
4. 🔮 市场情绪仪表盘 (Polymarket + Fear & Greed)

## 角色设定
- **熊猫**: 主角，散户视角（X 品牌 "摸爬滚打的熊猫"）
- **二哈(哈士奇)**: 伪装成狼，旁观者+问题解答者角色
- **WolfAI logo**: wolfai-logo-v2.png 去背版，水印用

## 待办
- [x] 创建第一个模板: 持仓涨跌排行动画 ✅
- [x] 接入 ElevenLabs 配音 ✅ (v3 + "My First Voice", 女声 cloned, 不自我介绍)
- [x] 接入 Wolf_Fintrack 真实数据 ✅ (PostgreSQL → 22 tickers)
- [x] 完整 pipeline 跑通 ✅ (数据→JSON→TTS→渲染→MP4, 一条命令)
- [ ] 创建更多模板（个股估值、市场情绪等）
- [ ] 固化成 cron job 自动化
