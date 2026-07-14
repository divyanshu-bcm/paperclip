# Version Documentation

The single place to see **who pushed what, and which frontend and backend pieces moved**.
Open this file to know what changed and where to look if something breaks.

- Entries are **newest first**.
- Every push to the default branch / merged PR adds one entry.
- Each entry is keyed by **date + time + owner** — that's how you correlate it back to the
  matching commit in `git log` (no commit SHA is recorded here).
- Both the **Frontend changes** and **Backend parameter changes** sections are *always*
  present — write `none` when that side didn't move.

The rule Claude follows to keep this file current lives in `.claude/rules/version-doc.md`.

---

## 2026-07-14 19:11 — Add version-doc push rule
- **Owner:** Divyanshu Shekhar
- **Branch / PR:** master / #—
- **Summary:** Introduce a mandatory version documentation log and a hard rule requiring an
  entry here before every push. One file to trace who changed what, frontend and backend.
- **Files touched:** `version-doc.md` (new), `.claude/rules/version-doc.md` (new),
  `CLAUDE.md` (version-doc section), `.gitignore` (whitelist `.claude/rules/` if needed).
- **Frontend changes:** none
- **Backend parameter changes:** none
