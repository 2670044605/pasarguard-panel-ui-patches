# Changelog

All notable changes to this patch repository will be documented in this file.

## [0.2.2] - 2026-04-09
### Fixed
- Custom image build flow now explicitly prebuilds `dashboard/build` before Docker packaging.
- Deployment notes now document that runtime startup fails if dashboard assets are not prebuilt.

## [0.2.1] - 2026-04-09
### Changed
- Deployment/build workflow now explicitly enables Docker BuildKit because upstream Dockerfile uses `RUN --mount=...`.
- Deployment notes now document the BuildKit requirement.

## [0.2.0] - 2026-04-09
### Added
- Deployment document for custom patched image rollout.
- Build script for deriving a custom PasarGuard image from fixed upstream source.
- Server-side deployment helper script for switching the compose image safely.

## [0.1.0] - 2026-04-09
### Added
- Initial patch repository for PasarGuard panel UI customization.
- Patch `0001-minimal-ui-debranding.patch`.
- Documentation for patch scope, upstream baseline, and maintenance workflow.

### Changed
- Sidebar community links removed.
- Sidebar `Support Us` entry removed.
- Sidebar GitHub `Star` button removed.
- Footer credit hidden.
