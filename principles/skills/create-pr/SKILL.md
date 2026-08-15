---
name: create-pr
description: Use when opening a pull request in the repository you are currently in: create the branch, commit following that project's rules, push, and open the PR with the template filled in. Trigger words: "create pr", "open pr", "pull request", "abrir pr", "hacer pr".
---

# create-pr

Turn a finished task into a reviewed pull request in the repository you are currently working on, following that project's own rules and conventions.

## Before you start

1. Verify the prerequisites and warn the user about any that are not met:
   - the folder is a git repository (`git rev-parse --is-inside-work-tree`),
   - there is a remote configured (`git remote -v`),
   - the working tree is clean or only holds changes for this PR,
   - the GitHub CLI is available (`command -v gh`); if it is not, say that the PR will be opened via a URL instead.
2. Read the current project's `AGENTS.md` and `rules/index.md` to learn which git and commit rules apply there.
3. Check the default branch (usually `main`).

## 1. Branch

1. Update the default branch first: `git pull --ff-only`.
2. Create a typed branch from it: `git checkout -b <type>/<slug>`.
3. Pick the type from Conventional Commits (`feat`, `fix`, `docs`, `chore`, `refactor`, `test`) and a short slug of the change, e.g. `feat/auth-login`.
4. Never commit to the default branch.

## 2. Commits

1. Group the work in atomic commits: one responsibility per commit.
2. Write Conventional Commit messages: `type(scope): summary`, e.g. `feat(auth): add login flow`.
3. Add a scope when it adds context, and reference the ticket or issue in the body.
4. Make small, frequent commits instead of one giant commit.

## 3. Checks before pushing

1. Run whatever checks the current project defines: lint, typecheck, tests, `make doctor`, CI scripts, or a `pre-push` hook.
2. Fix failures before continuing.

## 4. Push

1. Push the branch with upstream tracking: `git push -u origin <branch>`.

## 5. Pull request

1. Read the project's PR template at `.github/pull_request_template.md` if it exists and fill every section.
2. If there is no template, use this structure: context (what and why, with the ticket link), how to test, watch out, and a details section with a diagram when the flow has more than 3 steps.
3. Explain the context in short bullet points for readability, not a wall of text.
4. Write the description like a senior tech lead mentoring the team: explain the decisions and trade-offs, not just the result, and be honest about what is not done yet.
5. Add a diagram when a picture helps visualize the flow or structure. Use Mermaid in GitHub PRs, where it renders natively; use handmade ASCII in files and terminals, where Mermaid is not available.
6. When the change adds or modifies several endpoints, list them clearly: method, path, and what they do.
7. For frontend changes, add screenshots (before and after) or clear placeholders for them, so the reviewer can see the result without running the app.
8. Use a warm, human tone that is pleasant to read, and keep it short enough to skim.
9. Draft the full description into a temp file (e.g. `/tmp/opencode/pr.md`), show it to the user, and wait for their approval before opening the PR.
10. Open it with the GitHub CLI already assigned: `gh pr create --assignee @me` (or `--draft` while the work is in progress). If `gh` is missing, share the `pull/new/<branch>` URL instead.
11. If the assignment did not stick (for example `gh pr edit` fails), set it through the REST API: `gh api -X POST repos/<owner>/<repo>/issues/<number>/assignees -f assignees='["<user>"]'`.
12. Report the PR URL.

## Rules

- [MUST] verify the prerequisites (git repo, remote, clean tree, `gh`) before starting and warn the user about anything missing. { create-pr.prereqs }
- [MUST] work on a typed branch (`feat/...`, `fix/...`, ...) created from an up-to-date default branch; never commit to it directly. { create-pr.branch }
- [MUST] make atomic commits with Conventional Commits: one responsibility per commit. { create-pr.commits }
- [MUST] run the checks the current project defines (lint, tests, typecheck) before pushing. { create-pr.checks }
- [MUST] fill the project's PR template if present; fall back to the standard sections only when there is none. { create-pr.template }
- [SHOULD] explain the context in short bullet points for readability. { create-pr.context-bullets }
- [SHOULD] write the PR description in a mentoring voice: explain decisions and trade-offs, use a warm and human tone, and add a diagram when a picture helps (Mermaid in GitHub PRs, handmade ASCII elsewhere). { create-pr.voice }
- [SHOULD] list every added or modified endpoint clearly (method, path, what it does) when the change touches several of them. { create-pr.endpoints }
- [SHOULD] add screenshots (before and after) or clear placeholders for frontend changes. { create-pr.screenshots }
- [SHOULD] draft the description into a temp file and let the user review it before opening the PR. { create-pr.review-body }
- [SHOULD] assign the PR to the user who asked for it, with `gh pr create --assignee @me` or the REST API when `gh pr edit` fails. { create-pr.assignee }
- [SHOULD] reference the ticket or issue in the commit body and in the PR. { create-pr.ticket }
- [SHOULD] prefer `gh pr create` and report the resulting PR URL. { create-pr.gh }
- [NICE] open the PR as a draft while the work is still in progress. { create-pr.draft }
