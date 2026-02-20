# Vicente 职业规划 — 2026

> 创建: 2026-02-15
> 状态: 规划中

---

## 🎯 核心方向

**当前**: System Engineer (IT Infra)
**目标**: AI Platform Engineer / MLOps

```
System Engineer → Platform Engineer / SRE → AI Platform Engineer
```

---

## 📋 两个并行项目

### 项目 1: X 自动发帖工作流

| 要素 | 内容 |
|------|------|
| **人设** | 摸爬滚打的熊猫 (The Struggling Panda) |
| **视角** | 散户/初学者，非专业分析师 |
| **内容** | 金融知识 + 风险提醒 + 新闻分析 |
| **风格** | 简短、个人化、小额投资者视角 |
| **触发** | 发现相关新闻 → 总结 → 发布 |

**工作流**:
```
Wolf_Fintrack (新闻/数据)
    ↓
OpenClaw 分析 + 生成推文
    ↓
Vicente 审核
    ↓
发布到 X
```

**预计周期**: 1-2 周

---

### 项目 2: AI 系统初始化工具

**核心概念**: OS 安装时集成小型 AI 模型，实现自主系统初始化

**功能**:
- 网络检测和配置
- 基础系统设置
- 系统升级和健康检查
- 错误自我修复

**技术栈**:
- 容器化: Docker / Podman
- 小模型: Ollama + nemotron-nano / phi-3
- 编排: 可选 K3s
- 部署: 单一容器 or Compose

**产品形态**:
- Option A: Docker 镜像 (`docker run -it ai-system-init`)
- Option B: 系统服务 (systemd + 容器)
- Option C: Live USB / ISO (终极形态)

**预计周期**: 4-6 周

**面试亮点**:
1. 容器化 AI 工具 - Docker + AI 整合
2. 边缘计算思维 - 小模型 + 低资源
3. DevOps 实践 - CI/CD、镜像构建
4. 开源贡献 - GitHub 项目

---

## 📦 技能发展路径

### 容器化 (重点)

```
阶段 1：基础 ✅ 已完成
├── Docker 基础操作
├── docker-compose 多容器编排
└── 容器化应用部署

阶段 2：进阶 ⏳ 进行中
├── Kubernetes 基础
│   ├── Pod, Deployment, Service
│   ├── ConfigMap, Secret
│   └── 本地 K8s: minikube / kind / k3s
├── Podman (无 daemon)
└── 镜像优化 + 多阶段构建

阶段 3：AI + 容器
├── GPU 容器 (NVIDIA Container Toolkit)
├── AI 模型容器化部署
├── Ollama 容器化
└── Edge AI: K3s + 小模型
```

### 技能矩阵

| 现有技能 | 调整方向 | 优先级 |
|----------|----------|--------|
| Linux/Windows 部署 | + AI 自动化集成 | 🔴 高 |
| 容器化 (Docker) | → K8s / Podman | 🔴 高 |
| 自动化脚本 | + LLM 应用开发 | 🔴 高 |
| 网络/安全 | + 云原生安全 | 🟡 中 |

---

## 📅 6 周执行计划

| 周 | X 发帖工作流 | AI 系统初始化 | 容器化学习 |
|----|-------------|--------------|-----------|
| 1 | 设计 + API 接入 | 概念设计 | K8s 基础概念 |
| 2 | Skill 开发 | CLI 原型 | minikube 实操 |
| 3 | 测试 + 上线 | Docker 化 | Pod/Deployment |
| 4 | 日常运营 | 核心功能 | Service/Ingress |
| 5 | — | 测试优化 | K3s 边缘场景 |
| 6 | — | GitHub 发布 | GPU 容器 |

---

## 🏷️ 目标岗位关键词

- Kubernetes
- Container Orchestration
- AI/ML Infrastructure
- Edge Computing
- GitOps / Infrastructure as Code
- Platform Engineering
- MLOps / AIOps

---

## 📝 进度追踪

### X 发帖工作流
- [ ] X API 接入配置
- [ ] 发帖模板设计
- [ ] OpenClaw Skill 开发
- [ ] 测试运行
- [ ] 正式上线

### AI 系统初始化工具
- [ ] 项目仓库创建
- [ ] 概念文档
- [ ] CLI 原型
- [ ] Docker 镜像
- [ ] 核心功能实现
- [ ] 文档 + README
- [ ] GitHub 发布

### 容器化学习
- [x] Docker 基础
- [x] docker-compose
- [ ] K8s 概念
- [ ] minikube 实操
- [ ] K3s 边缘部署
- [ ] GPU 容器

---

## 💡 备注

- 行业趋势：VMware → 容器化加速
- 小模型爆发：Phi-3、Gemma、Llama 3.2、Nemotron-Nano
- NPU 普及：Intel/AMD/Qualcomm 都在推
- 边缘 AI 是蓝海，先做 PoC 有先发优势
