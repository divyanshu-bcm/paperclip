# Rule: version documentation on every push

**Status: MANDATORY.** A push to the default branch (or opening/merging a PR) is *not
complete* until an entry has been appended to `version-doc.md` at the repo root.

This rule exists so anyone can open one file and immediately see **who changed what, and
which frontend and backend pieces moved** — the fastest way to trace a change back later.

## When
Before you push or open a PR. Every code-affecting change gets an entry — no exceptions
for "small" changes.

## Where
Prepend to `version-doc.md` (repo root) so the **newest entry is on top**.

## Entry template
Copy this block verbatim and fill every field:

```markdown
## <YYYY-MM-DD HH:MM> — <short title>
- **Owner:** <name>
- **Branch / PR:** <branch> / #<PR number>
- **Summary:** <plain-language what changed and why>
- **Files touched:** <key files / areas>
- **Frontend changes:** <pages / components / styles / UX, or `none`>
- **Backend parameter changes:** <env vars / API params / config / schema, or `none`>
```

Both **Frontend changes** and **Backend parameter changes** are required — write `none`
when that side didn't move. Backend is the hard MUST (a mislogged backend/config change is
what breaks things silently); the frontend is logged with equal care.

### Field notes
- **Owner** — use `git config user.name`. If someone else directed the change, name them.
- **Date + time** — when you push, `YYYY-MM-DD HH:MM` (local). Together with **owner**
  this is how an entry is traced to its commit in `git log` — no SHA is recorded.
- **Branch / PR** — the branch and PR number (write `#—` if there's no PR yet).

## Workflow (single commit — no amend)

```sh
# 1. add the entry to version-doc.md (newest on top) with the current YYYY-MM-DD HH:MM
# 2. commit code + doc together
git add -A
git commit -m "<your message>"
# 3. push
git push
```

## What counts as a backend parameter change
Anything that alters runtime behaviour or config, e.g.:
- env vars (added / removed / renamed keys)
- API route params, request or response shape
- config values, feature flags, thresholds, cron schedules
- database schema / migrations / access policies

## What counts as a frontend change
Anything a user would see or interact with, e.g.:
- pages / routes / screens
- shared components
- styles / design tokens / layout
- copy, empty/loading/error states, UX flow
