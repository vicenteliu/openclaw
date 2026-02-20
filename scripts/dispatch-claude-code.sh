#!/usr/bin/env bash
# dispatch-claude-code.sh — 零轮询派发 Claude Code 任务
#
# Usage:
#   dispatch-claude-code.sh -p "Build a REST API" -n "rest-api" -w ~/Workspace/myproject
#   dispatch-claude-code.sh -p "Refactor tests" -n "test-refactor" -w ~/Workspace/myproject --agent-teams
#
# 派发后立即返回，Claude Code 完成后通过 hook 自动通知 OpenClaw

set -euo pipefail

# Defaults
PROMPT=""
TASK_NAME="task-$(date +%s)"
WORKDIR="$(pwd)"
PERMISSION_MODE="bypassPermissions"
AGENT_TEAMS=false

# Parse args
while [[ $# -gt 0 ]]; do
    case $1 in
        -p|--prompt) PROMPT="$2"; shift 2 ;;
        -n|--name) TASK_NAME="$2"; shift 2 ;;
        -w|--workdir) WORKDIR="$2"; shift 2 ;;
        --permission-mode) PERMISSION_MODE="$2"; shift 2 ;;
        --agent-teams) AGENT_TEAMS=true; shift ;;
        *) echo "Unknown option: $1"; exit 1 ;;
    esac
done

if [ -z "$PROMPT" ]; then
    echo "❌ --prompt is required"
    exit 1
fi

# Ensure workdir exists
mkdir -p "$WORKDIR"

# Write task metadata
cat > "$WORKDIR/.claude-task-meta.json" << EOF
{
    "name": "$TASK_NAME",
    "prompt": $(python3 -c "import json; print(json.dumps('$PROMPT'))"),
    "workdir": "$WORKDIR",
    "started_at": "$(date -u +"%Y-%m-%dT%H:%M:%S+00:00")",
    "agent_teams": $AGENT_TEAMS
}
EOF

# Build claude command
CLAUDE_CMD="claude --dangerously-skip-permissions"
if [ "$AGENT_TEAMS" = true ]; then
    CLAUDE_CMD="$CLAUDE_CMD --agent-teams"
fi

# Append output capture instruction to prompt
FULL_PROMPT="$PROMPT

When completely finished, write a brief summary of what you did to the file .claude-task-output.txt in the project root."

# Launch in background via nohup
cd "$WORKDIR"
echo "🚀 Dispatching: $TASK_NAME"
echo "   Workdir: $WORKDIR"
echo "   Agent Teams: $AGENT_TEAMS"
echo "   Prompt: ${PROMPT:0:100}..."

nohup bash -c "$CLAUDE_CMD '$FULL_PROMPT'" > /tmp/claude-dispatch-$TASK_NAME.log 2>&1 &
CLAUDE_PID=$!
echo "   PID: $CLAUDE_PID"
echo "   Log: /tmp/claude-dispatch-$TASK_NAME.log"
echo ""
echo "✅ Dispatched! Claude Code will notify OpenClaw when done."
echo "   Results will appear in: ~/openclaw/data/claude-code-results/latest.json"
