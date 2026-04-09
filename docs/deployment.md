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
- `bun` available on the build host, because `dashboard/build` must be prebuilt before packaging the image

## Correct build order
1. Clone upstream source at fixed ref.
2. Apply `patches/0001-minimal-ui-debranding.patch`.
3. Run `bun install` inside `dashboard/`.
4. Run `./build_dashboard.sh` to generate `dashboard/build`.
5. Build custom Docker image with BuildKit enabled.
6. Backup current compose file on server.
7. Replace PasarGuard image reference in compose.
8. Restart only the `pasarguard` service.
9. Verify login page and dashboard UI.

## Why prebuild is required
The upstream app will attempt to call `bun` at runtime if `dashboard/build` is missing. The runtime image does not include `bun`, so a production image without prebuilt dashboard assets will fail to start.

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
