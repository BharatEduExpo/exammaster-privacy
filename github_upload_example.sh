#!/usr/bin/env bash
# Example: upload files to GitHub via REST (replace placeholders)
# Requirements: jq, curl, base64 (macOS/Linux)

set -euo pipefail

REPO_OWNER="your-org"
REPO_NAME="exam-master-gpt"
BRANCH="main"
TOKEN="${GITHUB_TOKEN:-}"

if [ -z "$TOKEN" ]; then
  echo "Set GITHUB_TOKEN env var."; exit 1
fi

create_file() {
  local path="$1"
  local message="$2"
  local content_b64
  content_b64=$(base64 -w 0 "$path" 2>/dev/null || base64 "$path")
  curl -s -X PUT     -H "Authorization: token $TOKEN"     -H "Content-Type: application/json"     -d "{"message":"$message","content":"$content_b64","branch":"$BRANCH"}"     "https://api.github.com/repos/$REPO_OWNER/$REPO_NAME/contents/$path"
}

# Example uploads
create_file api/openapi_exam_master_v1_1.yaml "Add OpenAPI spec v1.1"
create_file schemas/pattern_profile.schema.json "Add pattern schema v1.1"
create_file config/pattern_profile_examples.v1_1.json "Add pattern config v1.1"
# ...repeat for other files or loop through tree
