# Chapter 1 Revision Notes

Supervisor feedback sources: `feedback/chapt1feedback.txt` and `feedback/handwritingfeedback.txt`

## File changed

- `introduction.tex` — only file modified in this revision pass

## Changes made

### Introductory blurb (before Section 1.1)

Rewrote from 4 paragraphs into the 4-paragraph + roadmap structure the supervisor requested:

1. **Para 1** — Robotics software importance (kept, lightly edited)
2. **Para 2** — Why software quality (correctness, maintainability) matters; replaces the old "diverse ecosystem" paragraph that did not fit the story
3. **Para 3** — SE best-practices gap with scientific software; citations to Hannay2009, Prabhu2011 kept; "thesis" → "report"
4. **Para 4** — Previous SoP studies + this report's goal + MPS shorthand introduced; explicit statement that the report does not rank packages
5. **Para 5** (new) — Roadmap of Chapter 1 sections

### Section 1.1 — Research Questions

Replaced the original 5 RQs with the supervisor's 9 revised RQs:
- RQ1: candidate set
- RQ2: ranking across nine quality attributes (merged from old RQ2 + RQ4)
- RQ3–RQ5: comparisons with other research software domains (artifacts, tools, practices)
- RQ6–RQ9: developer pain points and best practices (conditional on approved interview data)

MPS abbreviation (motion planning and simulation) defined here and used throughout.

### Section 1.2 — Scope

Changed "this thesis" → "this report". No structural changes; content was already correct.

### Section 1.3 — Overview of the Methodology

Condensed from 4 paragraphs to 1. Removed:
- mention-count details
- exact filtering steps and the number 28
- detailed Domain X template procedure
- interview protocol details

Added citations to prior SoP domain studies. LLM-assisted discovery positioned as auxiliary source only. Pointer to Chapter 3 for full procedures.

### Section 1.4 — Contributions

Rewritten with:
- Opening: "This report makes the following contributions:"
- "final study set" removed; clearer wording used throughout
- 5 distinct, non-redundant contributions (old contributions 2 and 3 were nearly identical; separated into discovery process vs. measurement dataset)
- Contribution 3 now cites Smith2021 for the Domain X measurement template
- Closing sentence simplified (removed negative parallelism)

### Section 1.5 — Organization

Rewritten to describe the supervisor's target 9-chapter structure:
- Ch 2: Background
- Ch 3: Methodology
- Ch 4: Commonality Analysis (`ch:selected-software-commonality`)
- Ch 5: Quality Measurement (`ch:measurement-results`)
- Ch 6: Comparison with other research software domains (`ch:discussion`)
- Ch 7: Developer Pain Points — conditional on approved interview data (`ch:developer-interviews`)
- Ch 8: Threats to Validity (`ch:recommendations` — **see TODO below**)
- Ch 9: Conclusion (`ch:conclusions`)

Each chapter entry now cites its addressed research questions (RQ1–RQ9).

### Global

Replaced all occurrences of "thesis" with "report" or "study" throughout `introduction.tex`. Verified with grep: zero remaining occurrences.

Applied humanizer pass to reduce AI writing patterns: removed rule-of-three constructions, negative parallelisms ("not X; rather, Y"), formulaic "first...then...finally" triples, and over-hedged phrases.

## Open TODOs

| Location | Issue |
|---|---|
| Section 1.4, contribution 3 | Confirm final package count; replace placeholder comment with exact number once confirmed |
| Section 1.5, Ch 8 entry | `recommendations.tex` currently contains recommendations content, not Threats to Validity. Needs to be restructured: move recommendation content into conclusion, replace with threats-to-validity material |
| Section 1.5, Ch 4 entry | `selected_software_commonality.tex` combines package listing + commonality analysis. Supervisor's target has this as a standalone Commonality Analysis chapter (Ch 4). Splitting is deferred. |
| Section 1.5, Ch 6 entry | `discussion.tex` covers comparison with other domains. Supervisor's target has this as a standalone Comparison chapter (Ch 6). Splitting from a Threats to Validity chapter is deferred. |

## What was NOT changed

- `background.tex`, `methodology.tex`, and all other chapter files — out of scope for this feedback pass
- LaTeX preamble and bibliography files
- Any existing citations or BibTeX keys
