---
name: contract-safe-refactor
description: >-
  Use when refactoring, restructuring, renaming, or extracting abstractions. Ensures changes do not
  alter externally observable behavior, shared data, or cross-component contracts unless explicitly requested.
  Especially important when modifying interfaces, data shapes, or boundaries between system parts.
---

# Skill: Contract-Safe Refactoring

Apply this skill whenever performing structural changes to a system.

## Core rule

Make **structural changes without changing observable behavior or contracts**, unless the user explicitly requests both.

If the task can be completed without changing behavior, do not change it.

## Decision process

Before making changes:

1. Identify the goal.
2. Ask:
   - Can this be done without changing behavior?
   - Does this affect anything shared across a boundary?
3. If unsure, **assume it is a contract and preserve it**.

## What counts as a contract

Treat anything used across boundaries as a contract, including:

- shared data shapes or message formats
- identifiers used by multiple components
- interfaces between modules or layers
- persisted or serialized structures
- configuration inputs
- assumptions relied on by other parts of the system

Do not change these unless explicitly instructed.

## Structural change rules

Allowed:
- reorganizing code or components
- extracting abstractions (interfaces, protocols, etc.)
- moving logic without changing results
- adapting call sites to preserve behavior

Not allowed unless explicitly requested:
- changing data formats or shapes
- renaming externally used identifiers
- changing responsibilities or ownership
- modifying validation, defaults, or side effects
- altering timing, ordering, or lifecycle behavior

## Abstraction rule

When introducing an abstraction:

- introduce the abstraction only
- keep existing behavior unchanged
- adapt existing code minimally
- do not bundle additional improvements or redesigns

## Naming rule

Only rename elements that are strictly internal.

If a name is used across a boundary, treat it as a contract.

## Execution discipline

Do not apply improvements just because they seem beneficial.

- Ignore unrelated cleanup
- Do not apply deferred ideas from a broader plan
- Separate “requested change” from “possible improvement”

If a behavioral improvement is useful, mention it but do not implement it.

## Output requirements

When finishing:

- state what structural changes were made
- confirm that behavior and contracts were preserved
- list any changes you intentionally did NOT apply
