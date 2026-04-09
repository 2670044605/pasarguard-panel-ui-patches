#!/bin/sh
set -eu

UPSTREAM_REPO="${UPSTREAM_REPO:-https://github.com/PasarGuard/panel.git}"
UPSTREAM_REF="${UPSTREAM_REF:-3d749e0}"
WORKDIR="${WORKDIR:-$(pwd)/build-work/panel-src}"
PATCH_FILE="${PATCH_FILE:-$(pwd)/patches/0001-minimal-ui-debranding.patch}"
IMAGE_TAG="${IMAGE_TAG:-local/pasarguard-panel-ui:3d749e0-jl1}"

mkdir -p "$(dirname "$WORKDIR")"
rm -rf "$WORKDIR"
git clone "$UPSTREAM_REPO" "$WORKDIR"
cd "$WORKDIR"
git checkout "$UPSTREAM_REF"
git apply "$PATCH_FILE"
docker build -t "$IMAGE_TAG" .

echo "Built image: $IMAGE_TAG"
