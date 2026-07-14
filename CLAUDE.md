# bioceutica_paperclip

## Version documentation — MANDATORY before every push
Before any push to the default branch / opening a PR you **MUST** append an entry to
`version-doc.md` (repo root). A push without a version-doc entry is incomplete. Full rule
& template: `.claude/rules/version-doc.md`.

Each entry records **owner + date & time**, **branch / PR**, **change summary + files
touched**, and two always-present sections — **Frontend changes** and **Backend parameter
changes** (write `none` for whichever didn't move). Entries are traced to commits by
date + time + owner — no commit SHA, single commit, no amend.
