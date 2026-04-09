# pasarguard-panel-ui-patches

A tracked patch repository for minimal PasarGuard panel UI customization.

## Purpose
This repository keeps a small, reviewable patch set for PasarGuard panel UI changes, with full Git history, changelog, and patch documentation.

## Current customization scope
- Remove sidebar community links (`Documentation`, `Discussion Group`, `GitHub`)
- Remove sidebar `Support Us`
- Remove sidebar `Star` button
- Hide footer credit `Made with ❤️ by PasarGuard Team`

## Upstream baseline
- Upstream repo: `https://github.com/PasarGuard/panel`
- Baseline commit: `3d749e0`
- Observed upstream version label: `v2.2.0`

## Repository layout
- `patches/` — reusable patch files
- `docs/` — patch notes and maintenance docs
- `scripts/` — image build and deployment helpers
- `CHANGELOG.md` — human-readable change log

## Apply patch
From a clean checkout of upstream baseline:

```bash
git apply patches/0001-minimal-ui-debranding.patch
```

## Build custom image

```bash
sh scripts/build-custom-image.sh
```

This build helper now performs the required frontend prebuild (`bun install` + `./build_dashboard.sh`) before Docker packaging.

## Deploy on server

```bash
TARGET_IMAGE=local/pasarguard-panel-ui:3d749e0-jl1 sh scripts/deploy-on-server.sh
```

## Files touched by patch
- `dashboard/src/components/layout/sidebar.tsx`
- `dashboard/src/components/layout/footer.tsx`

## Maintenance workflow
1. Pull latest upstream source
2. Rebase or re-derive patch against new upstream commit
3. Update docs and changelog
4. Commit
5. Push to GitHub
6. Rebuild custom image and redeploy

## Notes
- This patch intentionally avoids backend, DB, API, auth, and routing changes.
- Recommended deployment mode: fixed upstream commit + minimal patch + custom image.
- Do not skip frontend prebuild when deriving the production image.
