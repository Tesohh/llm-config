# Shared settings, sourced by every launch script.
# Override per run with env vars, e.g. `LLAMA_PORT=8080 ./gemma/4-26b/main.sh`.

LLAMA_HOST="${LLAMA_HOST:-0.0.0.0}"
LLAMA_PORT="${LLAMA_PORT:-11434}"

LLAMA_NET=(--host "$LLAMA_HOST" --port "$LLAMA_PORT")
