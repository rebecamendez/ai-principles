# Skills

Skills are small, reusable instruction packs. Each one is a folder with a `SKILL.md` inside:

```
principles/skills/<name>/
└── SKILL.md
```

## What goes in SKILL.md

- `name`: the skill's name (`<name>`), what the agent sees.
- `description`: when to use it. Make it specific so the agent only activates it when relevant.
- Body: step-by-step instructions, with any scripts the skill needs right next to it.

Skills don't need a `aip-` prefix: `make install` links every skill folder into the agents, and `make uninstall` removes only skills that are symlinks back to this repo (the symlink check), so your own skills are never touched.

## Add a skill

1. Create `principles/skills/<name>/SKILL.md`.
2. Run `make install`.
