# Agentic

Rules and skills for coding agents, installed with [Rulesync](https://github.com/dyoshikawa/rulesync).

This repository contains generated collections. Make content changes in [agentic-src](https://github.com/asmundwien/agentic-src).

## Install

Add Rulesync to your project:

```sh
pnpm add --save-dev rulesync
```

Create `rulesync.jsonc` to select the collections and target agent:

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

Fetch the collections, preview the generated files, then write them:

```sh
pnpm exec rulesync install
pnpm exec rulesync generate --delete --dry-run
pnpm exec rulesync generate --delete
```

This configuration installs the base rules and skills, adds the testing skills, and generates project-local `.omp/` files. For another agent, change `targets` to a value from the [supported tools reference](https://rulesync.dyoshikawa.com/reference/supported-tools).

Use `rulesync install --update` to resolve source refs again. For user-scope files, add `--global` to both `generate` commands.

## Credits

Thank you to the people who created and maintain these projects, and for sharing the work adapted in these collections:

- [skills](https://github.com/anthropics/skills) by [Anthropic](https://github.com/anthropics).
- [Superpowers](https://github.com/obra/superpowers) by [Jesse Vincent](https://github.com/obra).
- [skills](https://github.com/mattpocock/skills) by [Matt Pocock](https://github.com/mattpocock).
- [agent-skills](https://github.com/joshuadavidthomas/agent-skills) by [Josh Thomas](https://github.com/joshuadavidthomas).
- [plugins](https://github.com/poteto/plugins) by [Lauren Tan](https://github.com/poteto), including pstack and cli-for-agent.
- [plugins](https://github.com/cursor/plugins) by [Cursor](https://github.com/cursor).
- [agents](https://github.com/wshobson/agents) by [Seth Hobson](https://github.com/wshobson).
- [coding-standards](https://github.com/dmmulroy/skills/tree/main/coding-standards) and its [earlier draft](https://gist.github.com/dmmulroy/9c80f1f499b031aa0b6525b5d9ae25f0) by [Dillon Mulroy](https://github.com/dmmulroy).

Thanks also to [dyoshikawa](https://github.com/dyoshikawa) and the [Rulesync contributors](https://github.com/dyoshikawa/rulesync/graphs/contributors) for [Rulesync](https://github.com/dyoshikawa/rulesync), which makes collecting and installing this content possible.
