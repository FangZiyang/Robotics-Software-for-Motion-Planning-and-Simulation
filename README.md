# Chapter 1 Revision — Review Guide

**Feedback applied from:** `feedback/chapt1feedback.txt` and `feedback/handwritingfeedback.txt`

---

## Files changed

| File | What changed |
|---|---|
| `introduction.tex` | Full Chapter 1 revision (see detail below) |
| `main.tex` | Chapter order corrected to match target structure |
| `recommendations.tex` | Converted from Recommendations skeleton to Threats to Validity chapter |
| `discussion.tex` | Threats to Validity section removed (now lives in Ch 8) |
| `developer_interviews.tex` | Rewritten as planned component; no findings claimed |

---

## Chapter 1 changes

### Introductory blurb
- Para 1: kept (robotics software importance)
- Para 2: rewritten — emphasizes correctness, reliability, and sustainability explicitly; replaces old "diverse ecosystem" paragraph
- Para 3: revised — SE best-practices gap; citations Hannay2009, Prabhu2011 retained; "thesis" → "report"
- Para 4: new — prior SoP studies, this report's goal, MPS abbreviation defined, ranking clarified (ranking is done but not as universal recommendation)
- Para 5: new — Chapter 1 roadmap

### Section 1.1 — Research Questions
- Replaced 5 original RQs with 9 supervisor-specified RQs
- MPS abbreviation (motion planning and simulation) defined here

### Section 1.2 — Scope
- "this thesis" → "this report"; no structural changes

### Section 1.3 — Overview of the Methodology
- Condensed from 4 paragraphs to 1; details deferred to Chapter 3

### Section 1.4 — Contributions
- "This report makes the following contributions:"
- 5 concrete, non-redundant contributions
- Contribution 3 cites Smith2021 for Domain X template
- Package count stated as 28
- Closing sentence clarifies ranking vs. prescription distinction

### Section 1.5 — Organization
- 8-chapter outline matching actual `main.tex` order
- Each chapter references its addressed RQs
- Developer interview chapter described as planned component (no findings)
- Ch 8 references `ch:threats-to-validity` (correct label in `recommendations.tex`)
- No conditional/project-plan language; reads as final report outline

### Global
- All "thesis" → "report" (zero remaining occurrences verified)
- Humanizer pass: removed AI writing patterns (rule-of-three, negative parallelisms, "first…then…finally" triples)
- All TODO comments removed from `introduction.tex`

---

## Structural changes to thesis body

### `main.tex` — chapter order corrected
New order: introduction → background → methodology → selected_software_commonality → measurement_results → **discussion → developer_interviews** → recommendations → conclusion

Previously `developer_interviews` appeared before `discussion`; now corrected to match the target structure (Comparison Ch 6, Developer Pain Points Ch 7).

### `recommendations.tex` → Threats to Validity (Ch 8)
- Chapter title: `Threats to Validity`
- Label: `ch:threats-to-validity`
- Content: five sections covering candidate discovery, measurement consistency, snapshot-based data, LLM-assisted sources, and scope boundaries
- All placeholder recommendation sections removed

### `discussion.tex`
- `\section{Threats to Validity}` and its subsections removed (content moved to Ch 8)
- Remaining sections: Answers to Research Questions, Interpretation of Results, Implications for Users, Implications for Maintainers

### `developer_interviews.tex`
- Title: "Developer Interviews: Planned Component"
- States explicitly: no approved interview data available; findings reserved for future study
- Protocol and analysis approach described as planned methodology
- "Interview Findings" placeholder section removed

---

## Ranking clarification (key fix)

RQ2 asks for a ranking of packages. The intro now reads consistently:

> The report ranks the selected packages according to the defined quality attributes, but these rankings describe the current state of the practice and are not intended as a universal recommendation for any particular robotics task or context.

This resolves the earlier contradiction where the intro said "the report does not rank packages."

---

## No open TODOs remain in `introduction.tex`

All citation keys verified present in `references.bib`.
