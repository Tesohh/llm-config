#!/usr/bin/env bash
source "$(dirname "$0")/../../common.sh"

exec llama-server "${LLAMA_NET[@]}" \
  -hf nvidia/NVIDIA-Nemotron-3.5-Bolt-74B-A9B-24GB-GGUF \
  --jinja -fa on -np 1 --no-mmproj \
  --load-mode mlock \
  -c 128000 \
  -ctk q8_0 -ctv q8_0 \
  -b 1024 -ub 1024 \
  --temp 1.0 --top-p 0.95 --top-k 20 --min-p 0.0 \
  --presence-penalty 0 --repeat-penalty 1 \
  --n-cpu-moe 80 \
  "$@"
