#!/bin/bash
# ─────────────────────────────────────────────────────────────────────────────
# push-to-gitlab.sh
# Commits the latest dashboard and pushes to GitLab so Miki can review it.
# Run by Claude's end-of-day scheduled task, or manually anytime.
# ─────────────────────────────────────────────────────────────────────────────

set -e

REPO_DIR="$(cd "$(dirname "$0")" && pwd)"
cd "$REPO_DIR"

TODAY=$(date '+%Y-%m-%d')
TIME=$(date '+%H:%M')

echo "📊 Moxie Dashboard — end-of-day save ($TODAY $TIME)"

# Stage the dashboard file
git add jennifer-todo-dashboard.html

# Only commit if there are actual changes
if git diff --cached --quiet; then
  echo "✅ No changes since last save — dashboard is already up to date."
else
  git commit -m "Dashboard update: $TODAY $TIME

Auto-save from Jennifer's daily workflow.
Fresh data from Slack, Notion, and calendar.
Miki: review at the GitLab Pages URL."

  echo "📤 Pushing to GitLab..."
  git push origin main
  echo "✅ Dashboard saved and pushed. Miki can refresh the page to see updates."
fi
