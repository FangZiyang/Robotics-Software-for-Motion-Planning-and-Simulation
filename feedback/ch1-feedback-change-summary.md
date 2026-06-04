# Chapter 1 Feedback Change Summary

This note summarizes the changes made in response to `feedback/Ch1-Fdbck.pdf` and the follow-up request to fix citation formatting throughout the report.

## Scope of This Pass

Only the issues explicitly raised in the supervisor feedback, plus the follow-up citation-formatting issue, were changed. The measurement data, software lists, tables, and package scores were not rewritten.

The `examples/` folder was not edited.

## Supervisor Feedback and Changes Made

| Supervisor feedback | What was changed | How it was changed |
|---|---|---|
| Add "the" to the phrase "state of practice." | Updated the half-title wording. | In `definitions.tex`, changed `Robotics Software State of Practice` to `Robotics Software State of the Practice`. The school template font size was left unchanged. |
| Figure 1.1 must be explicitly mentioned and shown near the opening discussion. | Moved Figure 1.1 into the Chapter 1 opening page. | In `introduction.tex`, split the opening paragraph so the text now says `A sample of MPS software is shown in Figure~\ref{fig:motion-planning-example}` before the figure, changed the figure placement to `[H]`, and adjusted the image width so the figure appears on the first page of Chapter 1 instead of floating to the next page. |
| The sentence about software qualities not being guaranteed by domain expertise was awkward. | Reworded the sentence to focus on software quality as both an engineering and domain concern. | In `introduction.tex`, replaced the criticized sentence with a more direct statement about correctness, reliability, and sustainability for MPS software. |
| "There has historically been a gap..." should be revised. | Made the wording cleaner and more direct. | In `introduction.tex`, changed it to `However, a gap exists...`. |
| Use `\citep` / `\citet` instead of hand-written author-year citations. | Normalized citation commands in Chapter 1 and then across the report. | Parenthetical references now use `\citep{...}`. Author-as-subject references still use `\citet{...}`. |
| Do not put all prior State-of-the-Practice citations at the end of one long list. | Attached citations to the domains being named. | In `introduction.tex`, each prior domain now has its own nearby citation. |
| The report should not be framed as recommending a best package. | Clarified that rankings are descriptive, not recommendations. | In `introduction.tex`, changed the wording to say rankings are not a recommendation of any single software package. |
| RQ8 should refer to the software qualities in RQ2, not vague "quality concerns." | Reworded RQ8. | In `introduction.tex`, changed `software quality concerns identified in RQ2` to `software qualities listed in RQ2`. |
| Chapter 1 should not repeatedly say interview results are conditional on approved data. | Removed the conditional wording from the Chapter 1 research-question summary, methodology overview, and organization roadmap. | In `introduction.tex`, removed phrases such as `conditional on approved interview data` and `once approved interviews become available`. |
| Section 1.3 already functions as a high-level methodology overview; do not repeat the full roadmap there. | Removed the extra roadmap sentence at the end of Section 1.3. | In `introduction.tex`, removed the sentence saying Chapter 3 describes the full candidate discovery, filtering, and measurement procedures. |
| Contribution list should avoid extra hedging. | Removed the phrase `where supported by available evidence`. | In `introduction.tex`, the cross-domain comparison contribution now ends after the citation list. |
| Mathematical multi-letter symbols should not be written as `$CR$` and `$CI$`. | Changed AHP notation to use `\mathit{...}`. | In `notation.tex` and `background.tex`, changed `CR`, `CI`, and `RI` in math contexts to `\mathit{CR}`, `\mathit{CI}`, and `\mathit{RI}`. |
| Chapter 7 should not be titled as a planned interview component. | Changed Chapter 7 heading to developer pain points. | In `developer_interviews.tex`, changed `Developer Interviews: Planned Component` to `Developer Pain Points`. |
| Add a Recommendations chapter before Threats to Validity. | Made Chapter 8 a recommendations chapter. | Replaced the content of `recommendations.tex` with `Recommendations for Future Practice`, using only evidence already present in the report. |
| Threats to Validity should be organized by threat type. | Moved Threats to Validity into its own chapter and reorganized it. | Added `threats_to_validity.tex` with sections for `Reliability`, `Construct Validity`, `Internal Validity`, and `External Validity`; included it in `main.tex` after Recommendations. |
| Use round parenthetical citation style. | Configured natbib for round citations. | In `main.tex`, changed `\usepackage{natbib}` to `\usepackage[round]{natbib}`. |

## Report-Wide Citation Fixes

After the Chapter 1 fixes, the same citation issue was checked across the root thesis `.tex` files. The following files had bare `\cite{...}` commands changed to `\citep{...}` where the citation is parenthetical:

- `background.tex`
- `methodology.tex`
- `measurement_results.tex`
- `comparison_research_software.tex`

The following `\citet{...}` citations were intentionally kept because the author name is part of the sentence:

- `by \citet{Smith2021}`
- `\citet{Weiss1997} defines...`
- `\citet{Hannay2009} observe...`
- `\citet{Prabhu2011} report...`
- `The methodology follows \citet{Smith2021}`
- `as defined by \citet{Parnas1976} and \citet{Weiss1997}`
- `The commonality analysis follows the approach described by \citet{Weiss1997}`

## Verification Performed

The following checks were run after editing:

```powershell
rg -n "\\cite\\{|\\[[0-9]{4}[a-z]?(,|\\])|et al\\. \\[[0-9]{4}|\\([A-Z][A-Za-z]+ et al\\. \\[[0-9]" -S -g "*.tex" -g "!examples/**"
```

Result: no remaining bare `\cite{...}` commands or obvious hand-written author-year references were found in the root thesis `.tex` files.

```powershell
rg -n "\b(by|according to|as described by|as defined by|as reported by|following)~?\\citep\{|\\citep\{[^}]+\}\s+(defines|reports|argues|observes|describes|states|found|recommended|recommends)" -S -g "*.tex" -g "!examples/**"
```

Result: no obvious cases of grammatically incorrect `by \citep{...}`-style usage were found.

The report was rebuilt with the project Docker workflow:

```powershell
docker run --rm -v "${PWD}:/work" -w /work sb2nov/latex:latest pdflatex -interaction=nonstopmode -halt-on-error main.tex
docker run --rm -v "${PWD}:/work" -w /work sb2nov/latex:latest bibtex main
docker run --rm -v "${PWD}:/work" -w /work sb2nov/latex:latest pdflatex -interaction=nonstopmode -halt-on-error main.tex
docker run --rm -v "${PWD}:/work" -w /work sb2nov/latex:latest pdflatex -interaction=nonstopmode -halt-on-error main.tex
```

Result: `main.pdf` builds successfully. The log has no citation or undefined-reference warnings. Existing overfull/underfull box warnings remain, mostly from long table content and headings; those were not part of this feedback pass.

## Notes for Review

- No new bibliography entries were invented.
- No measurement results or package rankings were changed.
- The new Recommendations chapter is intentionally conservative and based only on evidence already present in the report.
- Some methodology-level text still explains that interview findings require approved data. That wording was not removed globally because removing it everywhere could imply interview results exist before they are available. The Chapter 1 roadmap was cleaned up because that was the part directly marked by the supervisor.

---

## Follow-up Review Pass (Claude)

After the Codex pass above, the supervisor feedback in `Ch1-Fdbck.pdf` was re-checked against the actual diff. Four items were either missed or did not match the supervisor's wording exactly. The follow-up edits below close those gaps. No other files were touched in this pass.

### Items fixed in this follow-up

| # | Supervisor feedback (location) | What Codex left | What was changed | Why |
|---|---|---|---|---|
| 1 | Section 1's roadmap paragraph: "Section 1.1 states ... **while** Section 1.2 defines ..." and "A high-level overview of the methodology **is provided in Section 1.3**." (Ch1-Fdbck.pdf p.22) | The five sentences for §1.1–§1.5 were left as five separate active-voice sentences. | Rewrote the paragraph in `introduction.tex` to join §1.1/§1.2 with "while" and restate §1.3 in passive voice. Combined §1.4/§1.5 with "and" for parallel flow. | The supervisor marked the exact two clauses; the previous wording ignored both markings. |
| 2 | "even ~~when~~ **if** they are widely used" in §1.2 Scope (Ch1-Fdbck.pdf p.22) | The original "even when" was left in place. | Changed `introduction.tex` to "even if they are widely used in robotics practice." | Direct one-word substitution from the supervisor's annotation. |
| 3 | Methodology Step 7: "Supplement the artifact-based results with **developer interviews on their** pain points and best practices." (Ch1-Fdbck.pdf p.25) | Codex wrote "developer perspectives on pain points and best practices." | Changed `introduction.tex` Step 7 to match the supervisor's wording verbatim. | "perspectives" softens the source of evidence; the supervisor explicitly wrote "interviews on their" to make the evidence source concrete. |
| 4 | Chapter 7 left-margin note: "The methodology should be covered in chapter 3" (Ch1-Fdbck.pdf p.10) | Codex renamed Chapter 7 to "Developer Pain Points" and renamed two section headings, but kept all the protocol/recruitment/analysis text in Chapter 7. That methodology content also still lives in §3.9 (Interview Component), so it was duplicated in both places. | In `developer_interviews.tex`, deleted §7.2 "Interview Protocol" and §7.3 "Pain-Point Analysis Approach" (both are methodology content already covered in §3.9). Added one bridge sentence to the chapter opening that points readers to §3.9 for protocol, recruitment, and analysis. Codex's chapter opening and §7.1 "Developer Perspective" were kept verbatim. A `% TODO` comment marks where the pain-point findings will go once approved interview data exist. | Removes the duplication the supervisor flagged while leaving Codex's prose intact where it was not affected by the supervisor's note. Chapter 3 now owns the methodology; Chapter 7 is reduced to a short stub that will host the findings once interview data are approved. |

### Items intentionally not changed in this follow-up

- The report-wide `\cite` → `\citep` sweep applied by Codex to `background.tex`, `methodology.tex`, `measurement_results.tex`, and `comparison_research_software.tex` was retained. The supervisor only marked citation style in Chapter 1, but consistency across the report is the natural follow-through and matches the natbib `round` configuration.

### Second follow-up pass: three literal-wording fixes

A subsequent reviewer pointed out three places where the supervisor's handwriting was not followed verbatim. All three are now applied literally:

| # | Supervisor wording (location) | Previous state | Final state |
|---|---|---|---|
| 5 | "and relatively recent" with a long arrow pointing at methodology Step 6 (Ch1-Fdbck.pdf p.24) | Step 6 in `introduction.tex` read "Compare the MPS findings with prior State-of-the-Practice studies of other research software domains." Earlier pass left this alone because the arrow's target was unclear. | Step 6 now reads "Compare the MPS findings with prior State-of-the-Practice studies of other (and relatively recent) research software domains." |
| 6 | "These are important for MPS software." crossing out "are not guaranteed by domain expertise alone." (Ch1-Fdbck.pdf p.19) | Codex rewrote the sentence as "For MPS software, qualities such as correctness, reliability, and long-term sustainability are therefore engineering concerns as well as domain concerns." The meaning matched but the wording did not. | Sentence now reads "Qualities such as correctness, reliability, and long-term sustainability are important for MPS software." This uses the supervisor's exact predicate "are important for MPS software" while keeping the subject phrase that the supervisor did not cross out. |
| 7 | RQ8: "qualities **mentioned**" (Ch1-Fdbck.pdf p.22) | Earlier pass wrote "qualities **listed** in RQ2" (same meaning, different word). | RQ8 now reads "the software qualities mentioned in RQ2" to match the supervisor's word choice. |

### Verification performed in this follow-up

```powershell
docker run --rm -v "${PWD}:/work" -w /work sb2nov/latex:latest pdflatex -interaction=nonstopmode -halt-on-error main.tex
docker run --rm -v "${PWD}:/work" -w /work sb2nov/latex:latest bibtex main
docker run --rm -v "${PWD}:/work" -w /work sb2nov/latex:latest pdflatex -interaction=nonstopmode -halt-on-error main.tex
docker run --rm -v "${PWD}:/work" -w /work sb2nov/latex:latest pdflatex -interaction=nonstopmode -halt-on-error main.tex
```

- `main.pdf` rebuilt successfully (130 pages).
- No undefined-reference or undefined-citation warnings in the final log.
- Pre-existing overfull/underfull `\hbox` and `\vbox` warnings on long tables and headings remain; they were not in scope for this pass.

### Files changed in this follow-up

- `introduction.tex` — items 1, 2, 3, 5, 6, 7 above.
- `developer_interviews.tex` — item 4 above (deleted §7.2 and §7.3 only; chapter opening, §7.1, chapter title, and label `ch:developer-interviews` all preserved).

No bibliography entries, measurements, ranking tables, or example files were touched.

---

## Current Chapter 7 Correction

The supervisor's handwritten note on the table of contents was interpreted as two requirements:

1. Interview methodology belongs in Chapter 3.
2. Chapter 7 should be about the results and analysis of developer pain points from interviews.

The earlier follow-up only partly addressed this. It removed most duplicated methodology from Chapter 7, but it left a visible Section 7.1 called `Developer Perspective` and a TODO-style placeholder. That still made Chapter 7 look like background/motivation rather than an interview-results chapter.

This pass changed only the interview-related text:

- `developer_interviews.tex` now states that Chapter 7 is reserved for interview results and pain-point analysis.
- The visible `Developer Perspective` section was removed so the table of contents no longer presents methodology or motivation as Chapter 7 content.
- No interview findings, participant counts, quotations, or pain-point themes were invented, because no approved interview transcripts, participant responses, consented summaries, or final findings are present in the project materials.
- `methodology.tex` was updated so Section 3.9 no longer says Chapter 7 currently describes the protocol, recruitment strategy, and analysis framework. It now says Chapter 7 is reserved for the results and analysis of the interview material.

If approved interview data are later added, Chapter 7 should be expanded into a real results chapter with sections for participant/project summary, reported pain points, practices used to address them, analysis by software quality, and comparison with the repository-based findings.

---

## MPS Domain Wording Check

The supervisor changed `the domain` to `the MPS domain` in Chapter 1 where the sentence refers to the specific domain studied in this report. The same issue was checked across the compiled thesis `.tex` files.

Where `the domain` referred specifically to the MPS study scope, it was changed to `the MPS domain` or equivalent wording in:

- `background.tex`
- `introduction.tex`
- `methodology.tex`
- `measurement_results.tex`
- `threats_to_validity.tex`

Remaining uses of `the domain` were left unchanged when they refer generically to the Domain~X methodology, prior MI/LBM study structure, or the general role of a domain expert. The unused `discussion.tex` file also contains similar wording, but it is not included from `main.tex`, so it was not edited in this pass.

---

## Ranking Recommendation Wording

The supervisor's note distinguishes the purpose of the rankings from package recommendation. The rankings should describe the current state of practice in software development, not recommend a robotics task, context, or particular package.

This was checked across the compiled thesis `.tex` files. The relevant wording was revised in:

- `introduction.tex`, where the opening motivation now says the rankings describe the current state of practice in software development rather than serving as recommendations for any particular software package.
- `introduction.tex`, where the contribution paragraph now says the rankings do not prescribe any particular software package.
- `comparison_research_software.tex`, where the RQ summary now says the report characterizes software development practice rather than recommending any particular software package.
- `methodology.tex`, where the mention-count caveat now refers to the overall suitability of a software package rather than suitability for a robotics task.
- `methodology.tex`, where the AHP-ranking caveat now says the ranking is not a universal recommendation of any particular software package.

---

## Chapter 7 Result-Chapter Restructure

The supervisor's table-of-contents note says that the interview methodology should be covered in Chapter 3 and that Chapter 7 should be about developer pain points, plus the results and analysis of the interviews.

This pass changed Chapter 7 from a short reserved stub into a result-chapter framework:

- `developer_interviews.tex` is now titled `Developer Pain Points and Interview Findings`.
- The chapter opening now explicitly says that protocol, recruitment, ethics status, and analysis procedure belong in Chapter 3.
- Chapter 7 now has result-oriented sections for the interview evidence base, overview of developer pain points, practices used to address pain points, analysis by software quality, cross-domain comparison, and summary of RQ6--RQ9.
- No participant counts, quotations, project-specific claims, cross-project themes, or interview-based recommendations were invented. The text states that those findings must be added only after approved interview records or consented summaries are available.
- `methodology.tex` was updated so Section 3.9 points to Chapter 7 as the result chapter, rather than describing it as only a reserved placeholder.

This keeps Chapter 3 responsible for interview methodology and makes Chapter 7 visibly match the supervisor's requested purpose without overstating evidence that is not yet in the project materials.

---

## Interview-Data Availability Wording

The supervisor's handwritten note was interpreted as a style instruction: write the report as if the interview data will be available, instead of repeatedly telling the reader that RQ6--RQ9 cannot be answered until interview data are approved or available.

This pass removed that half-finished wording from the compiled thesis text:

- `background.tex`: removed the conditional phrase `where ethics approval permits` from the summary of the Domain X process.
- `methodology.tex`: changed `planned developer interview component` to `developer interview component` and removed the paragraph saying approved interview data are not yet available or pending.
- `developer_interviews.tex`: removed the paragraph saying transcripts, participant responses, and final findings are not included. The chapter now uses formal placeholders such as `[Interview evidence summary to be inserted...]`, while keeping the result-chapter structure.
- `comparison_research_software.tex`: removed the sentence saying the current MPS study does not yet have approved interview findings.

No participant counts, quotations, pain-point themes, or interview-based conclusions were invented. The placeholders mark exactly where those details should be inserted after the interview coding records are ready.

---

## Methodology Overview Ranking Wording

The supervisor's handwritten note on Chapter 1 methodology Step 4 was read as `and relatively rank`. The point is that the methodology overview should say the selected packages are measured and ranked relative to one another, not only measured.

This pass changed only `introduction.tex` Step 4:

- Before: `Measure the selected packages using repository artifacts, documentation, releases, issue trackers, and project metadata.`
- After: `Measure and rank the selected packages relative to one another using repository artifacts, documentation, releases, issue trackers, and project metadata.`

This connects the overview to RQ2 and Chapter 5, where the report discusses quality-based rankings.
