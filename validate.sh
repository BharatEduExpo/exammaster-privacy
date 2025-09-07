#!/usr/bin/env bash
# Local validator for schemas and OpenAPI
set -euo pipefail

if ! command -v ajv >/dev/null; then
  echo "Installing ajv-cli globally..."
  npm i -g ajv-cli
fi
if ! command -v redocly >/dev/null; then
  echo "Installing @redocly/cli globally..."
  npm i -g @redocly/cli
fi

ajv validate -s schemas/pattern_profile.schema.json -d config/pattern_profile_examples.v1_1.json
ajv validate -s schemas/exam_conversation_starters.schema.json -d config/exam_conversation_starters.v1_1.json
ajv validate -s schemas/exam_diagnostics.schema.json -d config/exam_diagnostics.v1_1.json
redocly lint api/openapi_exam_master_v1_1.yaml
echo "All validations passed."
