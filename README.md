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

## Acknowledgments

Thank you to the people and teams who created and maintain the upstream rules and skills selected in [agentic-src](https://github.com/asmundwien/agentic-src), and whose work this project adapts:

- [Anthropic](https://github.com/anthropics) for [skills](https://github.com/anthropics/skills).
- [Jesse Vincent](https://github.com/obra) for [Superpowers](https://github.com/obra/superpowers).
- [Matt Pocock](https://github.com/mattpocock) for [skills](https://github.com/mattpocock/skills).
- [Josh Thomas](https://github.com/joshuadavidthomas) for [agent-skills](https://github.com/joshuadavidthomas/agent-skills).
- [Lauren Tan](https://github.com/poteto) for [plugins](https://github.com/poteto/plugins), including pstack and cli-for-agent.
- [Cursor](https://github.com/cursor) for [plugins](https://github.com/cursor/plugins).
- [Seth Hobson](https://github.com/wshobson) for [agents](https://github.com/wshobson/agents).
- [Dillon Mulroy](https://github.com/dmmulroy) for the [coding-standards skill](https://github.com/dmmulroy/skills/tree/main/coding-standards) and [earlier draft](https://gist.github.com/dmmulroy/9c80f1f499b031aa0b6525b5d9ae25f0) that inspired the adapted coding-standards content.

Thanks also to [dyoshikawa](https://github.com/dyoshikawa) and the [Rulesync contributors](https://github.com/dyoshikawa/rulesync/graphs/contributors) for the tooling used to collect and install this content.
