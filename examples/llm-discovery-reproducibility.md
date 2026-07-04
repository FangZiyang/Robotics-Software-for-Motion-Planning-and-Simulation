# LLM-Assisted Discovery — Reproducibility Record

Supplementary material for the auxiliary LLM-assisted candidate-discovery step described in
Section 3.3 (LLM-Assisted Sources) and Appendix B (Table B.3). It records the model, prompt, and
access date for each LLM output so the discovery step is reproducible in principle. These LLM
outputs were auxiliary discovery aids only: every candidate name was consolidated, filtered, and
verified against public evidence before any package was selected for measurement.

Both lists were produced on the **same day** with the **same prompt**, issued independently to two
different assistants — a controlled cross-model discovery pass.

Reproducibility of an LLM query rests on the **model, the exact prompt, and the access date** — not
on a conversation URL. No chat links are cited: the private conversation URLs are unstable and not
reader-accessible, and reporting model + prompt + date is the standard, reproducible-in-principle
record. The archived outputs live in the project's supplementary source catalogue
(`sofware-counting-webs.csv`).

## Shared prompt (verbatim, issued to both GPT and Gemini)

> Based on authoritative sources, compile a list of approximately thirty robotics software
> packages related to motion planning, control, and simulation. Include both general-purpose
> frameworks and specialized toolkits, indicating their origin, primary domain focus, and level of
> usage or citation popularity. Do not use any prior conversational memory.

## 1. GPT-generated robotics software list

- **Assistant / interface:** ChatGPT (web), Plus subscription.
- **Model:** GPT-5 — OpenAI's flagship model, released 7 August 2025 and the default ChatGPT model
  for Plus subscribers on the access date. (GPT-5.1 did not release until 12 November 2025.)
- **Web browsing:** enabled — every citation URL in the output carries `?utm_source=chatgpt.com`,
  the tag ChatGPT appends when its browsing tool surfaces a source.
- **Date accessed:** 2 November 2025.
- **Output:** 33-package catalogue with columns *Software · Origin/Maintainer · Primary domain(s) ·
  Usage/citation notes*. The table rows are archived in `sofware-counting-webs.csv` (lines 25–58);
  the full original output additionally includes an introductory sentence, a "Notes on scope and
  selection" categorization, and reference links [1]–[33].

## 2. Gemini-generated robotics software table

- **Assistant / interface:** Gemini (web), paid membership (Google AI Pro).
- **Model:** Gemini 2.5 Pro — Google's flagship Gemini model on the access date (released
  25 March 2025; it remained the flagship until Gemini 3 Pro replaced it on 18 November 2025).
- **Date accessed:** 2 November 2025.
- **Output:** consolidated table with columns *Package · Category · Origin · Primary Domain Focus ·
  Usage/Popularity*, archived in `sofware-counting-webs.csv` (lines 63–91).

## Model-provenance basis (release timeline)

- **GPT-5:** released 2025-08-07; the default ChatGPT model for Plus subscribers until GPT-5.1
  (2025-11-12).
- **Gemini 2.5 Pro:** released 2025-03-25; the flagship Gemini model until Gemini 3 Pro
  (2025-11-18).

Both successors post-date 2 November 2025, so on the access date GPT-5 and Gemini 2.5 Pro were
each the current flagship for a paid web user who used the default/latest model. The exact GPT-5
sub-mode (Instant vs. Thinking auto-routing) and Gemini tier configuration are not recoverable from
the archived outputs, but the model versions are as stated.
