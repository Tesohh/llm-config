#!/usr/bin/env bash
source "$(dirname "$0")/../../common.sh"

exec llama-server "${LLAMA_NET[@]}" \
  -hf peculiar-ragdoll/Tiel-Coder-35B-A3B-GGUF:UD-Q4_K_XL \
  --jinja -fa on -np 1 --no-mmproj \
  --load-mode none \
  -c 131072 \
  -ctk q8_0 -ctv q8_0 \
  -b 2048 -ub 2048 \
  -ngl 99 -cmoe --moe-cache-mib 4000 \
  -t 8 \
  --temp 1.0 --top-p 0.95 --top-k 20 --min-p 0.0 \
  --presence-penalty 0 --repeat-penalty 1 \
  "$@"
