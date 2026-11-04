# Agentic

Reusable rules and skills, installed with [Rulesync](https://github.com/dyoshikawa/rulesync). Content is maintained in [agentic-src](https://github.com/asmundwien/agentic-src); this repository distributes the built collections.

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
      "source": "asmundwien/agentic@main:collections/base/skills",
      "rulesPath": "collections/base/rules",
      "rules": ["*"],
      "skills": ["*"]
    },
    {
      "source": "asmundwien/agentic@main:collections/testing/skills",
      "skills": ["*"]
    }
  ]
}
```

Then install, review the generation preview, and apply it:

```sh
pnpm exec rulesync install
pnpm exec rulesync generate --delete --dry-run
pnpm exec rulesync generate --delete
```

This example generates project-local `.omp/` files. Change `targets` for another Rulesync-supported agent. User-scope generation requires explicit `--global` on both preview and generation; try it with isolated HOME/XDG directories before changing personal configuration.

## Choose collections

Browse [`collections/`](collections/) for the available collections after the first generation run. Choose each explicitly: `base` is not implicit. It provides the `bootstrap` and `unslop` rules and the `how`, `why`, and `principle-guard-the-context-window` skills.

The source suffix selects a collection's skills directory. `rulesPath` is independently relative to the repository root, not to that skills directory. Omit a source to omit its collection. Avoid selecting conflicting rule or skill names; Rulesync gives the first declared source precedence.

Generate the complete selection together, not one collection at a time into a shared destination. Always review the deletion preview.

## Update or remove

To update the selected collections:

```sh
pnpm exec rulesync install --update
pnpm exec rulesync generate --delete --dry-run
pnpm exec rulesync generate --delete
```

To remove a collection, remove its source from `rulesync.jsonc`, run `pnpm exec rulesync install`, then preview and regenerate the remaining selection together.

Keep `rulesync.jsonc` and the generated `rulesync.lock`. Ordinary installation retains locked artifact commits; `install --update` resolves the selected refs again. `main` is the rolling distribution. To pin a snapshot, replace `@main` in every source with the same full commit SHA from this repository—not a commit from `agentic-src`.

## Regenerate this repository

Run **Generate collections** manually from the [Actions page](https://github.com/asmundwien/agentic/actions) on `main`. It reads only `agentic-src/main`, builds every collection with frozen upstream locks, and updates `collections/` on this repository's `main` branch. Collection installation requires that this workflow has run successfully at least once.

The workflow uses GitHub's built-in token to push to this repository; no custom secrets are needed. It has no automatic trigger and leaves this README untouched. Content changes belong in `agentic-src`, not in generated collections here.
