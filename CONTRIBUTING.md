# Contributing

- Create a feature branch off `main`.
- Update JSON files and **validate** with `./scripts/validate.sh`.
- Ensure CI passes (AJV + Redocly).
- Open a PR and request review from CODEOWNERS.

## Code style
- JSON: 2-space indent, trailing newline.
- YAML: 2-space indent.
- Keep OpenAPI DRY; use `$ref` where possible.
