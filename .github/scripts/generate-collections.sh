#!/usr/bin/env bash
set -euo pipefail

source_root=$(cd "$1" && pwd)
# Require a new output directory; publication replaces the old collections later.
mkdir "$2"
output=$(cd "$2" && pwd)
workspace=$(mktemp -d)
trap 'rm -rf "$workspace"' EXIT

# Never reuse downloaded inputs, even when running from a developer checkout.
rsync -a \
  --exclude='/*/.rulesync/rules/.curated/' \
  --exclude='/*/.rulesync/skills/.curated/' \
  "$source_root/src/" "$workspace/"

shopt -s nullglob
configs=("$workspace"/*/rulesync.jsonc)
if (( ${#configs[@]} == 0 )); then
  echo 'No collection configs found.' >&2
  exit 1
fi

for config in "${configs[@]}"; do
  collection=${config%/*}
  name=${collection##*/}
  (cd "$collection" && rulesync install --frozen)

  # Flatten upstream content, then apply authored content without conversion.
  for feature in rules skills; do
    input="$collection/.rulesync/$feature"
    target="$output/$name/$feature"
    mkdir -p "$target"
    if [[ -d "$input/.curated" ]]; then
      rsync -a "$input/.curated/" "$target/"
    fi
    if [[ -d "$input" ]]; then
      if [[ "$feature" == skills ]]; then
        for skill in "$input"/*/SKILL.md; do
          skill=${skill%/SKILL.md}
          rm -rf "$target/${skill##*/}"
        done
      fi
      rsync -a --exclude='/.curated/' "$input/" "$target/"
    fi
  done
done
