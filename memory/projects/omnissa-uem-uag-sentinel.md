# Omnissa_UEM_UAG_Sentinel (GapBridge subtask)

## 定位
- Console 适合“查问题”；脚本监控适合“发现问题”。
- 目标：BYOD 场景下对 UEM/UAG 的高价值信号做清洗、聚合、降噪与告警联动。

## 关键痛点（BYOD）
1) 过滤单用户误操作，只对批量/聚集性异常报警（网段/机型维度）。
2) 高风险设备（如 DeviceCompromised）需要毫秒级联动阻断（UAG/防火墙），不能等策略延迟。
3) UAG 边缘健康监控不能只靠 ping：关注会话数、CPU/内存、过载风险。
4) ByteSIEM 做海量日志收集；脚本只消费“清洗后的高价值信号”。
5) UAG API + ByteSIEM 查询双保险。

## 数据面
- UAG（连接侧）：Auth failed 风暴、Tunnel 建立失败、证书/加密错误、系统负载与活跃会话。
- UEM（合规侧）：DeviceCompromised、EnterpriseWipe、跨地理登录聚合、UEM API 延迟。

## 链路规划（v1）
- UEM → ByteSIEM → 监控脚本（TLS；字段解析/索引验证）
- UAG Syslog → 脚本/中间件（TCP/TLS）
- UEM API 专用账号与凭据（只记录“需要”，不在 memory 里保存任何 secret）
- 告警分级：P1 电话（Impossible Travel），P2 群消息（UAG 内存）

## 当前进展（已记录的里程碑）
- Syslog 接收/入库/检测/总控流程打通；Web 页面上线（DB 展示 + 实时流 SSE）。
- 支持筛选（host/app/协议/关键词）。
- 防火墙开放：514/tcp 与 8080/tcp。
- 脚本总控入口：deploy/check/verify/watch/logs。
- v1.1 检测器（规则/去重/重开/持久化）与测试链路跑通，验收 GO。
- 新需求：确认 syslog 真实来源（sender IP），不只看报文字段 host。

## 代码/运行路径（来自 Telegram 会话记录）
- 工作机代码路径（bytedance 环境）：`/home/bytedance/Workspace/Omnissa_UEM_UAG_Sentinel/`

## 下一步（推荐优先级）
- 落地 `source_ip` 全链路：receiver → DB → API → UI。
- 告警路由（Feishu）先 dry-run 打通通路。

## 来源
- Daily notes: `memory/2026-02-20.md`
- OpenClaw session transcript (Telegram): `~/.openclaw/agents/main/sessions/*.jsonl`（已用关键词检索验证）
