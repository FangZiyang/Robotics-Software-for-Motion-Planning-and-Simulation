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

These are the author's records of how each query was issued. They are not backed by external
citations; where a fact cannot be recovered from the archived output, it is marked as such rather
than asserted.

## 1. GPT-generated robotics software list

- **Interface:** ChatGPT web app, web browsing on.
- **Model (as recorded):** GPT-5.
- **Date queried:** 2 November 2025.
- **Output archived:** 33-package catalogue (*Software · Origin/Maintainer · Primary domain(s) ·
  Usage/citation notes*) in `sofware-counting-webs.csv`, lines 25–58. The original chat also carried
  an intro sentence, a scope note, and reference links [1]–[33]; those links are not archived here.

## 2. Gemini-generated robotics software table

- **Interface:** Gemini web app.
- **Model (as recorded):** Gemini 2.5 Pro.
- **Date queried:** 2 November 2025.
- **Output archived:** consolidated table (*Package · Category · Origin · Primary Domain Focus ·
  Usage/Popularity*) in `sofware-counting-webs.csv`, lines 63–91.

The exact model sub-mode and account tier are not recoverable from the archived outputs and are not
claimed. Model names are recorded as observed at query time.
