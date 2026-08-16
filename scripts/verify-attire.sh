#!/bin/bash
set -euo pipefail

ROOT="$(cd "$(dirname "$0")/.." && pwd)"

required=(
  "assets/nephew-one-icon.svg"
  "assets/nephew-one-icon.png"
  "assets/NephewOneIcon.icns"
  "brand.json"
  "attire-pack.json"
  "gittalk/identity.json"
  "gittalk/pull-main.json"
)

for rel in "${required[@]}"; do
  [[ -f "$ROOT/$rel" ]] || { echo "Missing required Nephew One Icon attire asset: $rel" >&2; exit 1; }
done

grep -q '#18B7CE' "$ROOT/assets/nephew-one-icon.svg" || { echo "Canonical cyan is missing from SVG." >&2; exit 1; }
grep -q '>ICON</text>' "$ROOT/assets/nephew-one-icon.svg" || { echo "Dominant ICON mark is missing." >&2; exit 1; }
grep -q 'dominant-baseline="central"' "$ROOT/assets/nephew-one-icon.svg" || { echo "ICON vertical-centering contract is missing." >&2; exit 1; }
grep -q 'stroke="#FFFFFF"' "$ROOT/assets/nephew-one-icon.svg" || { echo "White outer border is missing." >&2; exit 1; }

echo "Nephew One Icon attire gate passed."
