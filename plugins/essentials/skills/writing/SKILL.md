---
name: writing
description: Writes and edits text a reader acts on, such as docs, READMEs, PRs, commit messages, prompts, skills, and AGENTS.md.
---

The **reader** is the person or model who uses the text later. The reader has not seen this conversation. The **keep test**: keep a line only if it tells the reader something they would not know or do without it, and the text does not say it elsewhere.

## Steps

1. Read the whole target. Done when you can name the reader and the purpose.
2. For docs only, pick one mode: **tutorial** (say what the reader builds, show the expected output after each step), **how-to** (steps to a goal, named by the task, no background), **reference** (facts for lookup, dry, complete, no opinion), or **explanation** (why, one topic, trade-offs, opinion allowed). Do not mix modes. Link instead.
3. If the reader is a model, read the files under Model references. Done when you have read each to its last line.
4. Check every line against the rules. Done when each line is kept, cut, or rewritten.
5. Search for each term you replaced. Done when no old term remains.
6. Reply with the diff or a table of change and rule applied, then at most one line. Edit the file only when the user asks.

## Rules

Words
- Use common words with literal meaning. Name the real symbol, file, flag, or command.
- Use one term for each idea. Define it once, in bold, at first use. Put definitions first.
- Cut before you reword. Change a word before you add a sentence. Edit where the meaning is.
- Say what to do. Write "do not" only when the reader would otherwise do it. Give a reason only when it changes what the reader does.

Sentences
- One idea per sentence. Split at about 25 words, or 20 for an instruction. Mix lengths.
- Use active voice and name the actor. Write instructions as commands. Put the condition before the instruction and the common case first.
- Write whole sentences with their verbs, "the", "a", and "that". Spell out arrows and abbreviations.
- Put "only" and "not" next to the word they change. Make each "it", "this", and "which" point at one noun. Break long noun strings.
- Use periods, not semicolons, em dashes, or slashes. Use straight quotes, serial commas, and sentence-case headings.
- Be specific: "a column rename fails the build", not "schema changes can cause issues". Keep reference dry. State a view in explanation.

Cut these AI tells
- Words: additionally, crucial, delve, enhance, landscape, pivotal, showcase, tapestry, testament, underscore, vibrant. "Serves as" and "boasts" become "is" and "has".
- Patterns: "-ing" tails ("ensuring..."), "not just X but Y", forced triples, synonym cycling, false "from X to Y", stacked hedges, generic conclusions, chatbot and flattery phrases, vague sources ("experts say").
- Metaphor nouns: substrate, wedge, vector, nexus, primitive, ratchet, scaffolding, north star, endgame, evacuate, "surface". Use the plain word.
- Feeling words ("stays close at hand"). If a sentence is not an instruction, fact, or number, or fits any project's docs unchanged, cut it.
- Adverbs ("significantly" becomes the number), colons as connectors, bold on every noun, inline-header lists that restate the line, decorative emoji, aphorisms.

Text a model reads
- Cut what the model does by default. Write the target behavior. Cut rules that guard against one past mistake.
- Order: definitions, steps (each with "Done when"), output format, rules.
- Give an output format as a template with `<placeholders>`, then one filled example. Keep worked examples whole.
- Use a plain instruction, not a quoted output string.
- Write a skill `description` as one line, third person, leading word first.

Claims
- When the user or the record asserts a fact, check it against the record. If it is wrong, say so with the evidence.

PRs and commits
- A PR body is a briefing a reviewer reads in under a minute. Link logs, SHAs, and metrics. Do not paste them.
- Make every count true at the commit that lands it.

## Model references

Paths are under `references/`.

| Read | When |
| --- | --- |
| `claude/prompting-claude-best-practices.md` | Target is a Claude model, or none is named. |
| `openai/prompt-engineering.md` | Target is an OpenAI model, or none is named. |
| `claude/prompting-claude-<model>.md` | The target is that Claude model: `opus-5-5`, `sonnet-5-5`, `haiku-5-5`, or `fable-5-2` (also for Mythos 5.2). |
| `openai/gpt-6-astra.md` | Target is `gpt-6-astra`, `gpt-6.1-sol`, `gpt-6.1-terra`, or `gpt-6-luna`. |
| `claude/skill-authoring-best-practices.md` | The text is a `SKILL.md` or a file it references. |

With no target model, write for both families. Where they disagree, pick what works on both, or tell the user the trade-off. With a target, follow its file.
