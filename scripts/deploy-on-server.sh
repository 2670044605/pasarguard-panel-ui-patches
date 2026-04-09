#!/bin/sh
set -eu

DEPLOY_DIR="${DEPLOY_DIR:-/opt/pasarguard}"
TARGET_IMAGE="${TARGET_IMAGE:-local/pasarguard-panel-ui:3d749e0-jl1}"
BACKUP_DIR="$DEPLOY_DIR/backups/ui-customization"
TS="$(date +%Y%m%d-%H%M%S)"

mkdir -p "$BACKUP_DIR"
cp "$DEPLOY_DIR/docker-compose.yml" "$BACKUP_DIR/docker-compose.yml.$TS.bak"

python3 - "$DEPLOY_DIR/docker-compose.yml" "$TARGET_IMAGE" <<'PY'
import sys
from pathlib import Path
p = Path(sys.argv[1])
image = sys.argv[2]
s = p.read_text()
old = '    image: pasarguard/panel:latest\n'
new = f'    image: {image}\n'
if old not in s:
    raise SystemExit('expected image line not found')
p.write_text(s.replace(old, new, 1))
PY

cd "$DEPLOY_DIR"
docker compose up -d pasarguard
docker compose ps
