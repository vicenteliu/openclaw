#!/bin/bash
set -e

DASH_DIR="$HOME/openclaw/dashboard"
TEMPLATE="$DASH_DIR/index.html"
OUTPUT="$DASH_DIR/live.html"

PANDA_QUEUE=$(ls ~/Workspace/panda-poster/approved/ 2>/dev/null | wc -l | tr -d ' ')
PANDA_POSTED=$(ls ~/Workspace/panda-poster/posted/ 2>/dev/null | wc -l | tr -d ' ')
PANDA_TOTAL=$((PANDA_QUEUE + PANDA_POSTED))
PANDA_PCT=$(( PANDA_TOTAL > 0 ? PANDA_POSTED * 100 / PANDA_TOTAL : 0 ))

VIDEOS_COUNT=$(ls ~/Workspace/panda-videos/out/ 2>/dev/null | wc -l | tr -d ' ')

WOLF_STATUS=$(docker ps --filter name=wolf_fintrack_collector --format "{{.Status}}" 2>/dev/null | head -1)
[ -z "$WOLF_STATUS" ] && WOLF_STATUS="stopped"

NOW=$(date '+%Y-%m-%d %H:%M PST')

# Cron data
CRON_JSON=""
while IFS= read -r line; do
  [ -z "$line" ] && continue
  name=$(echo "$line" | awk '{print $2}')
  status=$(echo "$line" | awk '{for(i=NF;i>=1;i--) if($i=="ok"||$i=="idle"||$i=="error"){print $i;break}}')
  [ -z "$status" ] && status="unknown"
  CRON_JSON="${CRON_JSON}{\"name\":\"$name\",\"schedule\":\"-\",\"next\":\"-\",\"last\":\"-\",\"status\":\"$status\"},"
done <<< "$(openclaw cron list 2>/dev/null | tail -n +2)"
CRON_JSON="${CRON_JSON%,}"

python3 -c "
import json

data = {
  'updatedAt': '$NOW',
  'projects': [
    {
      'icon': '🐼', 'name': 'Panda Poster', 'status': 'active', 'statusLabel': 'ACTIVE',
      'metrics': [
        {'label': '已发布', 'value': '$PANDA_POSTED 篇', 'color': 'green'},
        {'label': '待发布队列', 'value': '$PANDA_QUEUE 篇', 'color': 'yellow'},
        {'label': '下一篇', 'value': '007 寡妇交易 (明天 10AM)'}
      ],
      'progress': $PANDA_PCT, 'progressColor': '#4ade80'
    },
    {
      'icon': '📹', 'name': 'Panda Videos', 'status': 'active', 'statusLabel': 'ACTIVE',
      'metrics': [
        {'label': '已生成视频', 'value': '$VIDEOS_COUNT 个'},
        {'label': '最新', 'value': '播客止损陷阱 V4'},
        {'label': 'Pipeline', 'value': 'Wolf数据→TTS→Remotion'}
      ],
      'tasks': [
        {'text': '端到端 pipeline', 'done': True},
        {'text': '播客双人格式', 'done': True},
        {'text': 'V4 待 Vicente 反馈', 'done': False}
      ]
    },
    {
      'icon': '📈', 'name': 'Risk-First-Protocol', 'status': 'live', 'statusLabel': 'LIVE TRADING',
      'metrics': [
        {'label': '状态', 'value': '实盘交易中', 'color': 'red'},
        {'label': '账户', 'value': '~\$1,906 (Coinbase)'},
        {'label': '策略', 'value': 'Trend-Momentum + 海龟期货'},
        {'label': '扫描频率', 'value': '现货1h / 期货2h'}
      ]
    },
    {
      'icon': '🐺', 'name': 'Wolf_Fintrack', 'status': 'active', 'statusLabel': 'ACTIVE',
      'metrics': [
        {'label': 'Collector', 'value': '$WOLF_STATUS', 'color': 'green'},
        {'label': 'Symbols', 'value': '18 (Fidelity + 贵金属)'},
        {'label': '估值', 'value': 'PEG + DCF 自动检测'},
        {'label': 'DCF Cron', 'value': '每周六 9AM'}
      ]
    },
    {
      'icon': '💼', 'name': 'Operation Undock', 'status': 'planning', 'statusLabel': 'PLANNING',
      'metrics': [
        {'label': '目标', 'value': 'AI Platform Engineer'},
        {'label': '路径', 'value': 'SysEng → Platform → AI Platform'},
        {'label': '简历', 'value': 'cv.yaml 待重写'}
      ],
      'tasks': [
        {'text': 'career_background.md 母本', 'done': True},
        {'text': 'career-plan-2026 规划', 'done': True},
        {'text': 'cv.yaml 重写', 'done': False},
        {'text': '开始投递', 'done': False}
      ]
    },
    {
      'icon': '💰', 'name': '投资组合', 'status': 'active', 'statusLabel': 'ACTIVE',
      'metrics': [
        {'label': 'Fidelity', 'value': '稳健型 (SCHD/XLV/BND)'},
        {'label': 'Robinhood', 'value': '成长型 (NVDA/SOFI/PLTR)'},
        {'label': 'Coinbase', 'value': '自动交易 (~\$1,906)'},
        {'label': '监控', 'value': '6个价格警报 + 日报'}
      ]
    },
    {
      'icon': '🕵️', 'name': 'Project Pretender', 'status': 'planning', 'statusLabel': 'PLANNING',
      'metrics': [
        {'label': '定位', 'value': '中产润出信息服务'},
        {'label': '渠道', 'value': 'Telegram + X 小号'},
        {'label': '数据采集', 'value': '每日自动 (cron)'}
      ],
      'tasks': [
        {'text': '8国研究报告', 'done': True},
        {'text': '诈骗分析', 'done': True},
        {'text': '购买预付费 SIM', 'done': False},
        {'text': '频道上线', 'done': False}
      ]
    },
    {
      'icon': '📖', 'name': 'Novel-to-Audio', 'status': 'paused', 'statusLabel': 'PAUSED',
      'metrics': [
        {'label': 'Pipeline', 'value': 'Grok→剧本JSON→Qwen3-TTS'},
        {'label': '阻塞', 'value': '等 ComfyUI 环境', 'color': 'yellow'}
      ]
    },
    {
      'icon': '🎓', 'name': '副业规划', 'status': 'planning', 'statusLabel': 'PLANNING',
      'metrics': [
        {'label': '飞轮', 'value': 'Risk-First + AI课程 + X + 投资'},
        {'label': '合规', 'value': '已审查 ByteDance 合同 ✅', 'color': 'green'}
      ]
    }
  ],
  'crons': [$CRON_JSON]
}

# Read template, replace placeholder, write output
with open('$TEMPLATE') as f:
    html = f.read()
html = html.replace('__DASHBOARD_DATA__', json.dumps(data, ensure_ascii=False))
with open('$OUTPUT', 'w') as f:
    f.write(html)
print('Dashboard updated: $OUTPUT')
"
