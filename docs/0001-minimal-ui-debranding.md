# Patch 0001 — Minimal UI Debranding

## Summary
This patch removes non-essential promotional/community UI from the PasarGuard dashboard sidebar, disables the recurring donation popup, and hides the footer credit.

## Intent
Keep the panel visually cleaner while minimizing future merge pain.

## Removed UI
- Community group in sidebar
  - Documentation
  - Discussion Group
  - GitHub
- Sidebar `Support Us`
- Sidebar `Star` button
- Empty sidebar `Community` section title after link removal
- Recurring donation/support popup (`DonationPopup`)
- Footer text `Made with ❤️ by PasarGuard Team`

## Layout behavior
- The language/theme controls remain anchored in the bottom section of the sidebar.
- The empty community block is not rendered at all.

## Files modified
- `dashboard/src/components/layout/sidebar.tsx`
- `dashboard/src/components/layout/footer.tsx`
- `dashboard/src/pages/_dashboard.tsx`

## Non-goals
- No backend change
- No API change
- No database change
- No auth change
- No routing change

## Upgrade impact
Low. Future upstream upgrades should only require checking whether `sidebar.tsx`, `footer.tsx`, and `_dashboard.tsx` changed structurally.

## Validation checklist
- Login page works
- Sidebar main navigation works
- Users / Nodes / Settings pages open normally
- No community/support/star block is visible
- No empty `Community` title remains
- Language/theme controls stay in the bottom area
- Donation popup no longer appears periodically
- Footer credit is hidden
- No obvious frontend runtime error
