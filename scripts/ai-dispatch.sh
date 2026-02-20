#!/bin/bash
# ai-dispatch.sh — Unified multi-model dispatch
# Usage: ai-dispatch.sh <mode> <prompt>
# Modes: research | code | summarize | quick | image
#
# research  → Gemini 2.5 Pro (1M context, web grounded)
# code      → Claude Code (coding specialist)
# summarize → Gemini CLI (long doc summarization)
# quick     → Ollama local (zero cost, instant)
# image     → nano-banana-pro via OpenClaw skill

set -e

MODE="${1:?Usage: ai-dispatch.sh <mode> <prompt>}"
shift
PROMPT="$*"

case "$MODE" in
  research)
    echo "🔍 Dispatching to Gemini 2.5 Pro..."
    gemini --model gemini-2.5-pro "$PROMPT" 2>/dev/null
    ;;
  code)
    echo "💻 Dispatching to Claude Code..."
    SCRATCH=$(mktemp -d) && cd "$SCRATCH" && git init -q
    if ! claude -p "$PROMPT"; then
      echo "⚠️ Claude Code unavailable, fallback to Codex..."
      codex exec "$PROMPT"
    fi
    ;;
  summarize)
    echo "📄 Dispatching to Gemini (summarize)..."
    gemini --model gemini-2.5-flash "$PROMPT" 2>/dev/null
    ;;
  quick)
    echo "⚡ Dispatching to Ollama local (nemotron-3-nano)..."
    echo "$PROMPT" | ollama run nemotron-3-nano:latest 2>/dev/null
    ;;
  image)
    echo "🎨 Image generation requires OpenClaw nano-banana-pro skill"
    echo "Use: nano-banana-pro via Jerry"
    ;;
  *)
    echo "Unknown mode: $MODE"
    echo "Available: research | code | summarize | quick | image"
    exit 1
    ;;
esac
