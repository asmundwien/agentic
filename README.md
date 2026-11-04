# Agentic

Reusable rules and skills, installed with [Rulesync](https://github.com/dyoshikawa/rulesync). Content is maintained in [agentic-src](https://github.com/asmundwien/agentic-src).

This repository is an output artifact, not the source code.

## Install

Install the pinned CLI in your project:

```sh
pnpm add --save-dev --save-exact rulesync@43.6.0
```

Create `rulesync.jsonc` with the collections you want:

```json
{
  "targets": ["omp"],
  "features": ["rules", "skills"],
  "sources": [
    {
      "source": "asmundwien/agentic:base/skills",
      "rulesPath": "base/rules",
      "rules": ["*"],
      "skills": ["*"]
    },
    {
      "source": "asmundwien/agentic:testing/skills",
      "skills": ["*"]
    }
  ]
}
```

Then install, review the generation preview, and apply it:

```sh
pnpm exec rulesync install # add `--update` to resolve refs anew.
pnpm exec rulesync generate --delete --dry-run
pnpm exec rulesync generate --delete
```

This example generates project-local `.omp/` files. Change `targets` for another agent listed in the [Rulesync supported tools reference](https://rulesync.dyoshikawa.com/reference/supported-tools).

User-scope generation requires explicit `--global` on both preview and generation.

## Choose collections

Browse [the `agentic-src` collection directories](https://github.com/asmundwien/agentic-src/tree/main/src) for the available collections.
