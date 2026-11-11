---
name: prompting
description: Guides writing prompts, system prompts, agent instructions, and skills for Claude and OpenAI models. Use when writing or revising any of them.
disable-model-invocation: true
---

Everything you write or change under this skill is read by a model: prompts, system prompts, agent instructions, skills, tool descriptions, and files such as `AGENTS.md`. The user may name a **target model** for it.

## Files

**Base files** (read for every task):

- `references/claude/prompting-claude-best-practices.md`: all current Claude models.
- `references/claude/prompting-claude-opus-5-5.md`: Claude Opus 5.5.
- `references/claude/prompting-claude-sonnet-5-5.md`: Claude Sonnet 5.5.
- `references/openai/gpt-6-astra.md`: `gpt-6-astra`, `gpt-6.1-sol`, `gpt-6.1-terra`, and `gpt-6-luna`.
- `references/openai/prompt-engineering.md`: OpenAI models in general.

**Extra files** (read when the condition holds):

| Extra file | Condition |
| --- | --- |
| `references/claude/prompting-claude-fable-5-2.md` | Target model is Claude Fable 5.2 or Mythos 5.2. |
| `references/claude/prompting-claude-haiku-5-5.md` | Target model is Claude Haiku 5.5. |
| `references/claude/skill-authoring-best-practices.md` | The text is a `SKILL.md` or a file it references. |
| `references/openai/frontend-prompt.md` | The text covers building a frontend. Written for GPT-5.5; many patterns apply to later models. |

## Steps

1. Before you write, read the base files and matching extra files in full. Read a long file in parts until its last line. Base the text on all of them.
2. With no target model, make the text work on Claude and OpenAI models. Where files disagree, pick what works on both, or tell the user the trade-off.
3. With a target model, tune the text for it and follow its file where files disagree. If it has no file, use what the base files say about it by name.

If the user tells you to read only some files, read only those.

## Links

A link to a reference file's source page means the local file: read the file, not the URL. A Claude file's source page is the `url` in its frontmatter. `references/openai/<name>.md` is `https://developers.openai.com/api/docs/guides/<name>.md`, except `gpt-6-astra.md`, which is `guides/latest-model/gpt-6-astra` or `guides/latest-model`. Links match with or without `.md` or a `#fragment`.
