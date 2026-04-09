# Deploying the custom PasarGuard UI image

## Goal
Deploy a custom PasarGuard panel image with a minimal UI patch while keeping backend/runtime behavior unchanged.

## Baseline
- Upstream repo: `PasarGuard/panel`
- Upstream ref: `3d749e0`
- Custom image tag: `local/pasarguard-panel-ui:3d749e0-jl1`

## Requirements
- Docker daemon available on target host
- BuildKit enabled for image build (`DOCKER_BUILDKIT=1`)
- `bun` available only if you want to build frontend outside Docker; the official image build path does not require host-side bun during `docker build`

## Steps
1. Clone upstream source at fixed ref.
2. Apply `patches/0001-minimal-ui-debranding.patch`.
3. Build custom Docker image with BuildKit enabled.
4. Backup current compose file on server.
5. Replace PasarGuard image reference in compose.
6. Restart only the `pasarguard` service.
7. Verify login page and dashboard UI.

## Rollback
Restore the previous `docker-compose.yml` backup and run:

```bash
docker compose up -d pasarguard
```

## Validation
- `docker compose ps` shows `pasarguard` healthy/up
- `https://pasarguard.jerrylabs.dev/dashboard/` loads normally
- Sidebar promo/community entries are gone
- Footer credit is hidden
