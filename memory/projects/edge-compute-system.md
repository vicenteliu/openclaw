# Edge_Compute_System (GapBridge subtask)

## 一句话定位
在办公区建立“统一容器化计算平台 + 统一运维管理 + 安全与合规基线”，承接办公室侧应用部署运行，降低对云端生产系统峰值冲击。

## 为什么做
- 提升办公室内部服务体验，降低对云端生产系统峰值冲击。
- 避免业务各自建设带来的低效率、重复成本、标准不统一。
- 统一应用管理与资源管控，降低长期运维与合规风险。
- 办公区域建立可持续安全防护基础。

## 怎么做（摘要）
- 办公区机房部署计算设备，容器化方案。
- 以应用为中心，打通全生命周期管理（上线/发布/修改/启停/下线）。
- 监控告警聚合指标；多副本多活。

## 建设要求概要（摘记）
- OS: Debian 12.8；系统环境全英文；内部仓库。
- 基础配置：chrony + 双 NTP；limits + sysctl；关闭防火墙与 NetworkManager（按文档要求）。
- 组件：docker-ce 27.4.1、docker-compose 2.30.3、nginx 1.26.3、keepalived、portainer agent。
- 监控/日志：node_exporter、cadvisor、vector。
- 存储/网络：RAID + LVM；bond4 + 多网段 IP。

## 初期服务范围（摘要）
DNS / NSS / 安全蜜罐 / NTA / NPM / 办公网飞书媒体服务 / 职场防尾随 / VEGA / 办公室 CDN(bit)

## 文档状态
- 已完成提交版文档收敛：Executive Summary、Problem→Solution Mapping、Implementation Plan（含 Entry/Exit Criteria）、Risk & Mitigation、Decision & Ask。

## 来源
- Daily notes: `memory/2026-02-20.md`
- OpenClaw session transcript (Telegram) 中包含项目说明文本（已关键词检索确认）
