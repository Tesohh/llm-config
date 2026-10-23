#!/usr/bin/env bash
source "$(dirname "$0")/../../common.sh"

exec llama-server "${LLAMA_NET[@]}" \
  -hf unsloth/gemma-4-26B-A4B-it-qat-GGUF:UD-Q4_K_XL \
  --jinja -fa on -np 1 \
  --load-mode mlock \
  -c 100000 \
  -ctk q8_0 -ctv q8_0 \
  -b 1024 -ub 1024 \
  --temp 1.0 --top-p 0.95 --top-k 64 --min-p 0.0 \
  --presence-penalty 0 --repeat-penalty 1 \
  --n-cpu-moe 28 \
  --spec-type draft-mtp --spec-draft-n-max 2 \
  "$@"
