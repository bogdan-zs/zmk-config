#!/usr/bin/env bash
set -euo pipefail

root="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)"
mkdir -p "$root/firmware"

docker run --rm --platform linux/amd64 \
  -v "$root/config:/workspace/config:ro" \
  -v "$root/firmware:/firmware" \
  -w /workspace \
  zmkfirmware/zmk-build-arm:stable sh -ec '
    west init -l config
    west update --fetch-opt=--filter=tree:0
    west zephyr-export
    for shield in totem_left totem_right settings_reset; do
      west build -s zmk/app -d "/tmp/build-$shield" -b seeeduino_xiao_ble -- \
        -DZMK_CONFIG=/workspace/config -DSHIELD="$shield"
      cp "/tmp/build-$shield/zephyr/zmk.uf2" \
        "/firmware/$shield-seeeduino_xiao_ble-zmk.uf2"
    done
  '
