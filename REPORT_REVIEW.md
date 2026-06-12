# 论文 Review 报告

**日期：** 2026-06-10
**范围：** main.tex + 全部正文章节（Ch1–Ch10）+ 附录 A–F + 前置页（abstract/lay abstract/dedication/acknowledgements/declaration/notation/definitions）+ 交叉引用、引文、图片文件完整性检查。

**按你的要求：**
- 访谈未做是已知状态，不算问题；相关章节按"计划框架"标准来审。
- `summary.csv` 数据**未做真伪核对**（以你为准）。我只检查了**正文文字 ↔ 正文表格**之间的内部一致性。
- **本报告只列问题，没有改动任何论文文件。**

**总体评价：** 正文 Ch1–Ch6 + Ch8–Ch9 写作质量整体很好：结构清楚、claim 有节制、第 5 章正文数字与表格高度一致（我逐项核对了各 quality 的 top/lowest 包名、分数区间、Q-rank/S-rank/Δ 全表，全部对得上）。主要问题集中在：**前置页占位符、三处正文自相矛盾、附录与正文脱节、以及一批小的措辞/一致性问题**。

---

## P0 — 必须修改（提交前必改）

### 1. 前置页全是模板占位符，会原样印进 PDF
| 文件 | 现状 |
|---|---|
| `abstr.tex` | 只有 `\prefacesection{Abstract}`，内容为空 |
| `layabstr.tex` | 空（McMaster 要求 Lay Abstract ≤150 词） |
| `acknowledgements.tex` | 空 |
| `dedic.tex:6` | 模板字 `Your Dedication \\ Optional second line` |
| `academicachievementdeclaration.tex:3` | 半句模板话：*"The student will declare his/her research contribution and, as appropriate,"* —— 句子是断的，会照印 |
| `definitions.tex:13–14` | `\submitdate{MONTH YEAR}`、`\copyrightyear{YYYY}` —— 标题页会印出 "MONTH YEAR" 和 "YYYY" |

另外 `definitions.tex:20` 把 Spencer Smith 和 Matthew Giamou 都放在 `\principaladviser` 里。Giamou 是 domain expert，是否作为 co-supervisor 印在标题页上，**建议和导师确认**。

### 2. PhysX 平台支持：三处说法互相矛盾
- `selected_software_commonality.tex:13`：*"Twenty-seven packages support Linux (PhysX's open-source SDK listed only Windows...)"*
- `selected_software_commonality.tex:151`（V5）：*"While **all** packages support Linux..."* ← 与上面直接矛盾
- `measurement_results.tex:56`：27 支持 Linux，但又补充 PhysX 实际上有 Linux build path（记录值低报）

建议：V5 改成 "27 of 28 packages support Linux in the measured records (see the PhysX caveat in Section 5.1)"；同时 `selected_software_commonality.tex:182` 的参数表 V5 取值只有 "Linux-only, Linux + Windows + macOS, web-based"——**缺一个能容纳 PhysX 的取值**（如 "Windows-only (as recorded)"），而 "web-based" 似乎没有任何包对应，需要确认或删掉。

### 3. "AHP 没有计算" vs 第 5 章给了一张 AHP 图
- `background.tex:86`：*"the present report **does not compute** AHP rankings"*
- `methodology.tex:254`：*"AHP rankings are **not computed** here"*
- 但 `measurement_results.tex:338` + 图 `fig:ahp-ranking`（:404–409）：用 Domain X 算法、等权重**实际计算了**一个 illustrative AHP 排名。

第 5 章自己的限定（"illustrative, not elicited"）写得没问题，但前两章的绝对说法和它冲突，考官一对照就会问。建议把 background/methodology 的措辞改成："不计算基于正式权重启发（elicitation）的 AHP 排名；第 5 章仅含一个等权重的示意性计算。"

### 4. 附录 A、B、E 是"孤儿"——正文从未引用它们
交叉引用扫描结果：`appendix:full-candidate-software-list`（附录 A）、`appendix:mention-count-source-list`（附录 B）、`appendix:interview-materials`（附录 E）在正文中**零引用**。读者根本不知道它们存在。建议：
- `methodology.tex` §3.3（candidate discovery）→ 引用附录 B；§3.4/§3.6 → 引用附录 A
- `methodology.tex` §3.5（filtering）→ 引用附录 D（目前只有附录 A 内部引用它）
- `methodology.tex` §3.7.1（template）→ 引用附录 C（目前只有结论章和附录 F 引用它）
- `methodology.tex` §3.9 或 Ch7 → 引用附录 E（或在材料齐之前先把空的附录 E 从 main.tex 注释掉，免得 PDF 里出现一章空白附录）

**连带问题——"Appendix B" 歧义：** 正文多处说 "the Domain X **Appendix B** template"（`methodology.tex:197`、`measurement_results.tex:6`、`background.tex:46`），指的是 Smith (2021) 论文的附录 B；而本论文自己的附录 B 是 mention-count 来源列表。两个 "Appendix B" 必然混淆。建议统一写成 "Appendix B **of \citet{Smith2021}**"，并把指向自家附录的地方一律用 `Appendix~\ref{...}`。

### 5. 结论章三个小节是空的（计划内，但要列入完成清单）
`conclusion.tex:7/12/19`：Summary、Answers to RQs、Key Findings 全是 TODO 注释，编译出来是三个空标题。访谈前其实**可以先写 RQ1–RQ5 的回答**（不依赖访谈），只把 RQ6–RQ9 留 TODO——这样草稿在任何时点给导师看都完整得多。

---

## P1 — 强烈建议修改

### 6. `tab:repository-metrics`（`measurement_results.tex:285–325`）没有排序规则
该表既不是字母序、也不是 star 序、也不是质量序（AirSim, Bullet, CARLA, **ROS 2**, MuJoCo, Drake, Webots, **Gazebo**, PhysX, ...），caption 也没说明。全文其他大表要么按字母（metadata、overall impressions）要么按 Q-mean（quality-vs-community），唯独这张乱序。建议按字母或按 star 排序并在 caption 说明。

### 7. 图编号与首次提及顺序不一致
`measurement_results.tex:338` 正文先提 `fig:quality-heatmap`、后提 `fig:quality-ranking`，但物理位置（:381 vs :388）相反，导致正文先引用 Figure 5.2 再引用 Figure 5.1。交换两个 figure 环境的位置或调整句序即可。

### 8. 附录 A 候选表缺 mention count 列；"Excluded" vs "Not selected" 的区分没讲清
- `appendixA.tex` 表只有 Package/Role/Status 三列，**mention count 数字只存在于 xlsx 里**，论文里看不到。透明性是你方法论的卖点（"makes the selection process auditable"），建议加一列 Mention Count。
- "Not selected" 的定义前后不一致：`appendixA.tex:6` 说 *"ranked below the cutoff... or subsumed"*，`appendixA.tex:87` 说 *"did not meet the open-source, repository-measurability, or activity criteria, or were subsumed"*——是没过线还是没过滤网？两处统一。
- 同为专有软件，MATLAB/Unity 是 "Excluded (non-OSS)" 而 KineoWorks/RoboDK/RobotStudio/Delmia 是 "Not selected"。建议加一句状态定义：例如 *Excluded = 进入候选短名单后被明确过滤决定移除（Ch3 有记录）；Not selected = mention count 低于入围线，未进入逐项过滤*。

### 9. 附录 B 的 10 篇学术来源论文没有正式引用
`appendixB.tex:43–64` 的学术来源（Brugali 2007、Collins 2021、Körber 2021 等）是表格纯文本，没有 `\citep`、不进参考文献列表。这些是你候选发现方法的核心证据来源，应转成 BibTeX 引用（Collins et al. 2021 已有 key `collins2021simulators`）。同时 `methodology.tex` §3.3.1 通篇没有引用任何一篇具体 survey，至少 cite 几篇代表作。

### 10. 论文里出现仓库内部路径 `examples/...`、`AI-Agent/`
出现处：`methodology.tex:61`、`appendixA.tex:4`、`appendixB.tex:9,85`、`appendixC.tex:4`（`summary.csv`）、`appendixD.tex:65`、`appendixF.tex:139`。读者/考官拿不到这些文件；`sofware-counting-webs.csv` 的拼写错误（sofware）在论文里会被当成 typo。建议：把数据存档到 MacSphere/Zenodo 之类可引用的位置后统一改为引用存档；或在前言/附录加一句"补充材料随论文提交"的说明，并只用一种统一称呼。

### 11. 方法论 §3.2 两段重复
`methodology.tex:24` 与 `:26` 都在说 Giamou review 了 candidate list、确认 scope（"He reviewed the candidate software list, confirmed that the scope was appropriate..." → 下一段又 "The domain expert was asked to review the candidate software list... confirmed that the list was reasonable"）。合并为一段。另外 MATLAB 排除由 Giamou 确认这件事在 `:26`、`:78`、`appendixD.tex:8` 说了三遍——正文里留一处即可（附录可保留）。

### 12. 推荐章（Ch8）偏薄、偏泛，且没有挂 RQ
- Intro `:80` 承诺 "each chapter notes the research questions it addresses"，其他章都做到了，唯独 `recommendations.tex` 没提任何 RQ。建议开头注明：本章基于 artifact 证据给出初步建议，RQ8/RQ9 的完整回答待访谈完成。
- 对照 LBM/MedImaging 的推荐章，你的建议可以更具体、和测量 gap 一一对应，比如：documented user characteristics（1/28）、explicit coding standard（14/28）、compatible OS versions listed（61%）、required package versions listed（68%）、uninstall guidance——每条建议直接引用对应数字会有力得多。

### 13. 威胁章（Ch9）遗漏了几个明显威胁
`threats_to_validity.tex` 目前没有提：
- **单一测量者**、无 inter-rater 检查（Reliability 节只说 "judgement calls... recorded"，没说是谁、有没有复核）；
- **安装只在 Linux VM 上做**（`methodology.tex:236`）——Installability/Reliability 分数有平台偏差；
- **时间预算（每包 1–4 小时）限制了测量深度**；
- 另外把候选来源偏差归在 *Internal* Validity（`:19`）值得斟酌——描述性研究里这更像 selection/construct 问题，考官可能挑分类。

### 14. 命名不一致
| 位置 | 写法 A | 写法 B |
|---|---|---|
| `appendixA.tex:28` "Habitat-Sim" | 其余全文及 CSV 均为 "Habitat" | 统一 |
| `appendixA.tex:30` "MoveIt! / MoveIt~2" | 正文均为 "MoveIt!"（Ch4 已定义指 MoveIt 2） | 统一为 "MoveIt!" |
| AirSim 角色：`methodology.tex:155` 表 "Simulator (aerial vehicles)" | `selected_software_commonality.tex:34` 文字 "drones **and ground vehicles**" | 二选一 |
| `appendixA.tex:38` "Real-time control framework" | `methodology.tex:174` "Control framework" | 统一 |

### 15. 模板字段计数前后不一致
- `methodology.tex:206`：Maintainability "**(8 questions)**" 但列出的只有 7 项（version, contribution, artifacts, issue tracking, closure rate, comment %, version control）；附录 C 同样是 7 个实质问题 + impression。其他类别的计数都不含 impression，这里要么改成 7、要么统一计数口径。
- `methodology.tex:200` Summary Information 的 17 项清单里有 "additional comments" 但没有 "last commit date"；`appendixC.tex:8–26` 的 17 项正好相反（有 last commit date、无 additional comments）。两份清单逐项对齐。
- `methodology.tex:220` GitHub-style metrics 含 open/closed issues、developers、release/commit dates；`appendixC.tex:140–155` 的 Repository Metrics 列表没有这些项。对齐。

### 16. Notation / Abbreviations 缺项
- `notation.tex` Notation 节缺 **$\mathit{RI}$**（random index，`background.tex:84` 公式用到）和 $n$。
- Abbreviations 缺正文用过的：**SLAM**（ch4:76）、**TRI**（ch4:74、metadata 表）、**AIST**、**IIT**、**CVC**（metadata 表 "CVC Barcelona"）、**OMG**（ch4:78）。
- "SCC — Source-code line counter used for measurement" 是描述不是展开，建议写明是 `scc` 工具并给引用/URL。

### 17. Ch6 CI 段落数字口径混用
`comparison_research_software.tex:59` 段落主题是 "Continuous integration should be interpreted more cautiously"，但通篇用的是 **25/28（defined development process）**；而 Ch5 `:123` 另有 **26/28（CI or equivalent）**。两个数字含义不同，这段要么用 26/28 的 CI 数，要么把主题句改成 development-process evidence。

---

## P2 — 文字润色（可选）

| 位置 | 问题 | 建议 |
|---|---|---|
| `introduction.tex:4` | "**A sample of MPS software** is shown in Figure 1" 但图是路径规划任务示意，不是软件样例 | 改 "An example motion planning task is shown in..." |
| `introduction.tex:13` | "...has direct **consequences**... These **consequences** make software quality a **central** concern..." 循环重复；且 MPS 已定义却又全拼 | 合并两句；用 MPS |
| `introduction.tex:38` | "RQ2 **measures** the selected packages" —— RQ 本身不会去测量 | "RQ2 concerns the measurement/ranking of..." |
| `introduction.tex:17` vs `:50` | "**applies** the same methodology" vs "**adapts** the State-of-the-Practice methodology" | 统一为 adapts（你确实改了 LLM 来源） |
| `introduction.tex:58` | "other **(and relatively recent)** research software domains" 括号别扭 | "other, more recently studied research software domains" 或删 |
| `introduction.tex:70` | "Domain~X measurement template" 在 Intro 首次出现无解释 | 加一个短括号说明或前移定义 |
| `background.tex:23` | "Commercial software is software developed by a business as part of its **business**" | "...developed and sold by companies as a commercial product" |
| `background.tex:33` | "It starts with **picking** a suitable domain" 偏口语 | selecting |
| `background.tex:37` | "share a common **shape**" 偏口语 | structure / outline |
| `measurement_results.tex:1` | 章题 "Ranking Projects by Quality **Measure**"（单数；且章内容比"排名"更广） | "Quality Measures" 或 "Measurement Results and Quality Ranking" |
| `measurement_results.tex:283` | "All data **is** from May 2026" vs `:4` "The data **were** collected" | 统一 data are/were |
| `measurement_results.tex:483` | 四模式段落约 20 行一大段，bold 内联小标题 | 拆成四小段或 itemize |
| 全文（约 8 处） | "should be read / should be interpreted / should be understood as" 句式反复 | 适当换写法 |
| 多处 | 句尾挂 "-ing" 尾巴（"reflecting its growing role"、"reflecting the dominant languages"、"reflecting either sustained..."） | 抽几处改成完整子句 |
| `selected_software_commonality.tex:157` | V8 列举顺序 "Apache 2.0, BSD, MIT, LGPL" 与 `:13` 的计数顺序（BSD 11 > Apache 5 > MIT 4）不一致 | 按频次排 |
| `methodology.tex:274` + `selected_software_commonality.tex:6` | 承诺 "capabilities... are explicitly noted / marked as needing confirmation"，但全文实际没有任何这种标注 | 若全部已核实，改为过去式说明（"all capability claims were verified; none required a confirmation marker"）或删句 |
| `recommendations.tex:18` | "A short explanation of **what the automation checks** would make the evidence easier..." 有歧义（garden path） | "A short note explaining what the automation checks (builds, tests, packaging) would make..." |
| `measurement_results.tex:356` | Gazebo 九项全 10、均分 10.0——考官几乎必问 | 加一两句：满分是 impression calculator 在该时间预算/检查清单下的输出，并指出哪些证据支撑（CI、教程、release 流程），说明它≠完美软件 |
| `developer_interviews.tex` | 小节顺序对应 RQ6 → RQ8 → (quality) → RQ7+RQ9，编号跳跃 | 可在章首加一句说明分组逻辑，或按 RQ 顺序重排 |
| `appendixF.tex:17–50` | 说 prompt "is **reproduced** below"，但引文里出现 "The requirements were:"，更像转述/翻译而非逐字 | 若非逐字，改为 "translated/paraphrased from the original prompt" |
| `sample_chapter.tex` | 模板残留：含坏引用 `\ref{appendix_b}`、两个只为它存在的引文 key（`hudlicka2002time`、`popescu2014gamygdala`，且检查显示并不在两个 .bib 中） | 未被 main.tex 编译，无害，但建议删除文件（连同 `figures/Sample/`），避免误 include |
| `selected_software_commonality.tex:11` | "with the ROS-Industrial Consortium coordinating related industrial applications" 与本段主题（开发主体）略偏 | 可删可留 |

---

## 一致性检查通过项（增强信心用）

- **第 5 章正文 ↔ 表格全部吻合**：九个质量类别的 top/lowest 包名与分数、分数区间、未计入包（ROS 2、ODE）的处理说明，逐项核对一致；`tab:quality-vs-community` 的 Q-rank、S-rank、Δ 全表验算无误；Mean 列与九项分数的算术一致。
- **"28 packages" 全文一致**；Ch4 三类分组 8+10+10=28；附录 A 的 Measured 行=28。
- **交叉引用无悬空**（唯一坏引用在未编译的 `sample_chapter.tex`）；**正文引用的 BibTeX key 全部存在**；7 个图片文件齐全。
- **MoveIt!、ROS~2 拼写全文一致**；"surface" 前缀的解释（background:46）到位。
- **RQ 溯源**：除 Ch8 外，各章开头都注明了所回答的 RQ，与 Intro `:80` 的承诺相符。
- **PhysX 公共 SDK 的大段 caveat**（ch5:62）、AirSim alive 标签限定（ch4:33）、ODE 低活跃说明（ch5:58）都写得诚实、到位——这是论文的加分项。
- discussion.tex 已按导师意见退役且注释清楚，main.tex 中正确排除。

---

## 访谈完成后的更新清单（备忘）

1. `developer_interviews.tex` 整章从"计划框架"改写为发现章（RQ6–RQ9）。
2. `conclusion.tex` 四个 TODO（Summary / Answers to RQs / Key Findings / Future Work 补充项）。
3. `introduction.tex:88` Ch7 的描述（"identifies the interview evidence still needed"）。
4. `methodology.tex:281–285` §3.9 的 ethics/recruitment 时态与实际情况对齐（回应率等）。
5. `recommendations.tex` 补充由访谈支撑的建议（RQ8/RQ9）。
6. `appendixE.tex` 放入获批的 ethics 材料/协议。
7. `abstr.tex` / `layabstr.tex` 撰写（含最终结论）。
8. Ch6 `:72` "The MPS interview component is planned separately" 等措辞同步更新。

---

# 第二轮深挖补充（2026-06-12）

本轮新增的检查：完整 Docker 编译（**167 页成功产出**）+ 构建日志分析；`references.bib` 条目质量；把论文中引用 MI/LBM/Domain X 先前研究的句子与本地 `examples/` 原文逐条对照；拼写一致性与双词扫描；伦理委员会名称核查。

## 新增必改（P0）

### N1. 误引 MI 研究的安装成功率 — `measurement_results.tex:95`

论文写：*"...the Medical Imaging study, where only about half of MI packages **installed successfully**"*。Ao 论文 Installability 一节原文（`examples/AIMSS-MedImaging-Ao/.../14MeasurementResults.tex`）：

- *"We found **installation instructions** for 16 projects"*（16/29 **有安装说明**）；
- 装不上的只有 **3 个**：*"dwv and GATE broke in the building stage... we could not install the dependency for DICOM Viewer"*；
- 且 *"**most** of the software products did not 'break' during installation"*。

"约一半"对应的是**安装说明覆盖率（16/29）**，不是安装成功率（26/29 成功）。建议改写为类似："where installation instructions were found for only 16 of 29 packages and three packages could not be installed"。修正后对 MPS 的对比其实更有利（MPS：28/28 有说明、仅 2/28 失败且可恢复）。

### N2. "peer-reviewed methodology" 与引用条目矛盾 — `introduction.tex:68`

贡献 1 称 *"applying the **peer-reviewed** methodology of \citet{Smith2021}"*，但 `references.bib:21` 的 Smith2021 是 `@unpublished` + `note = {arXiv:2110.11575}`（预印本，未经同行评审）。要么删掉 "peer-reviewed"，要么改引已发表版本（若有）。

### N3. 伦理委员会名称写错 — `methodology.tex:281`

论文："the McMaster Research Ethics Board (**MacREM**)"。MacREM 是**网上申请系统**，委员会缩写是 **MREB**。证据：`examples/Domain X.md:241` *"approved by the McMaster University Research Ethics Board under the application number **MREB#: 5219**"*；`examples/background.md:137` *"preparing a **MacREM** Research Ethics Application"*（指系统）。建议改为 "the McMaster Research Ethics Board (MREB), with the application submitted through the MacREM system"。

### N4. 版面事故：第 5 章一处 **867pt 的 Overfull \vbox**（约一整页高度的纵向溢出）

构建日志 page [61]：`Overfull \vbox (867.40033pt too high) has occurred while \output is active`，位置紧邻 summary-metadata 表（28 行、`[H]` 固定放置；双倍行距模板下一页装不下）。**请翻 PDF 第 60–63 页确认该表是否被裁切或溢出页底。** 建议：改 `longtable`、对该表局部 `\singlespacing`，或拆成两表。

## 新增建议（P1）

### N5. 参考文献条目问题（`references.bib`）

1. **Dong2021**：实为已发表的 2024 期刊论文（Smith, Dong, Carette, Noseworthy 2024），bib 却是 `@unpublished` + "Manuscript, McMaster University"，缺期刊名/卷期页码；key 叫 2021、year 是 2024（natbib 输出无碍，但条目要补全为 @article）。
2. **Weiss1997**：`journal = {Submitted to IEEE Transactions on Software Engineering}` 会**原样印进参考文献**；avayalabs.com 链接已死。建议改引正式出处（Weiss, "Commonality Analysis: A Systematic Process for Defining Families," ARES 1998，或 Weiss & Lai 1999 专著）。
3. **作者名形式混用 4 种**：`Smith, W. Spencer` / `W. Spencer Smith` / `Spencer Smith` / `Smith, Spencer` → 统一为一种。
4. `Smith2018Seismology` 缺页码/期号；`Acton2026Checklists` 的 URL 只指到 ideas-productivity.org 首页，建议换成具体活动页。
5. **`references_another.bib` 是空文件**，却挂在 `main.tex:137` 的 `\bibliography{references,references_another}` 里；`sample_chapter.tex` 引用的两个 key（hudlicka2002time、popescu2014gamygdala）在两个 bib 里都**不存在**——一旦误启用 sample_chapter 就会出 undefined citation。连同删 sample_chapter 一并清理。

### N6. "160 person-hours" 把目标当成了设计值 — `background.tex:33`、`methodology.tex:238`

Domain X 原文：*"we estimate the time to complete an assessment for a given domain at **173 person hours**"*，*"This is close to our goal of 1 month of person hours (**160 hours**)"*。论文两处写 "designed to fit within roughly 160 person-hours" / "The target is approximately 160 person-hours"——160 是"一个人月"的**目标**，原文自估是 173。建议措辞："estimated at roughly 173 person-hours against a one-person-month (160-hour) goal"。
其余方法论数字全部核验吻合：~30 个候选 ✓、20 个访谈问题 ✓、18 个月 alive 规则 ✓、15–30% 回复率 ✓、每包 1–4 小时 + 安装 ≤2 小时 ✓。

### N7. 版面：18 处 Overfull \hbox，其中 5 处 ≥18pt 肉眼可见

| 位置 | 超宽 | 原因 |
|---|---|---|
| `measurement_results.tex:191–202`（maintainability 指标表） | **78.3pt ≈ 2.7cm** | 表格整体超出版心 |
| `measurement_results.tex:62` | 38.1pt | `\texttt{NVIDIA-Omniverse/PhysX}` 不可断行 |
| `recommendations.tex:20` 节标题 | 35.3pt | "Recommendations for Future State-of-the-Practice Studies" 标题过长 |
| `comparison_research_software.tex:65` 节标题 | 30.6pt | "Comparison of Principles, Processes, and Methodologies" |
| `appendixA.tex:4` | 30.1pt | `\path{examples/software-list-counting-result.xlsx}`（与"内部路径"问题叠加） |

另：6 个图的 PDF 版本警告（图为 PDF 1.7，文档默认上限 1.5）——在导言区加 `\pdfminorversion=7` 即消。**好消息：无 undefined references/citations、无 multiply defined、BibTeX 零警告。**

### N8. 附录 F 与 summary.csv 的贡献者数口径差

附录 F 记 PyBullet **311** contributors / MuJoCo **116**；`summary.csv` 第 6 行记 **333 / 138**（commit-log 口径）。两者方法不同（GitHub contributors API vs 提交日志计数），并不矛盾，但建议附录 F 加半句注明口径，免得读者两边对不上。

### N9. 正文未给出候选池总规模

附录 A 实际列出 **63 项**（28 measured + 8 excluded + 27 not selected），但 §3.4/§3.6 从未说"合并去重后共 N 个候选"。补一句总数能直接支撑 "makes the selection process auditable" 的主张。

## 新增小项（P2）

- `selected_software_commonality.tex:31` "supports **modeling**" 是全篇唯一的美式拼写（其余一致为加式：behaviour×3、coloured×3；summarize 属加拿大惯用 -ize）→ 改 modelling。双词重复（the the 等）扫描：0 处 ✓。
- Habitat 命名（升级第一轮发现）：CSV 软件名字段本身就是 "**Habitat-Sim**"，正文用 "Habitat"、附录 A 用 "Habitat-Sim"。测的就是 habitat-sim 仓库，建议全文统一为 Habitat-Sim。

## 本轮验证通过（论文对先前研究的引用，逐条对照原文）

- MI："user manual 22/29" ✓（期刊原文 "User manual (22)"）；"code style guides were rare" ✓（原文 rare 清单含 code style guidelines）。
- LBM："67% / alive 73% 版本控制" ✓（§6.3 逐字吻合）；"API documentation was rare" ✓（"None have explicit API documentation"）；"约半数提到文档生成工具" ✓；"test cases 不常见" ✓（仅 Ludwig、Musubi）。
- Domain X 方法论数字 ✓（见 N6）。
- 编译 167 页成功；九类 impression 均值（7.4/7.7/7.8/7.4/7.3/7.5/7.6/7.3/7.4）复算全部吻合。

> 说明：本轮为做编译检查重新生成了 `main.pdf` 及 aux/log 等构建产物（与你平时构建产物相同），**论文源文件（.tex/.bib/.csv）一个字未动**。

---

# 修复记录（2026-06-12，已获作者授权执行；供 codex review 对照）

最终构建状态：**176 页；BibTeX 0 警告；0 处 undefined references/citations；0 处 Overfull \vbox；仅剩 3 处原文档已有的 11.6–18.5pt 轻微 hbox 超宽**（background.tex×2、methodology.tex×1，≤6.5mm，修复前即存在）。图未重新生成：六张图的输入数据（impression 分数、stars、status、包名）一项未改，重导出比对仅差字体时间戳（1–6 字节）。

## P0 全部修复
1. **前置页**：Abstract / Lay Abstract / Acknowledgements / Declaration of Academic Achievement 均已撰写（各带 `% TODO` 提示访谈后或提交前更新；Declaration 含附录 F AI 试验的署名说明）；`definitions.tex` 日期改为 June 2026 / 2026（TODO 确认）；dedication 的 `\include` 注释掉（个人内容留给作者）。**principaladviser 两人并列保持原样——需作者与导师确认**。
2. **结论章**：Summary、Answers to RQ1–RQ5（RQ6–RQ9 明确标注待访谈，保留 TODO）、Key Findings 已写成；Future Work 扩展（访谈、AHP 权重启发、纵向复测）。
3. **PhysX/Linux 三处矛盾**：V5 改 "27 of 28 + PhysX 记录口径说明"；参数表 V5 增 "Windows-only (as recorded)"、删无对应的 "web-based"。
4. **AHP 矛盾**：background §2.6、methodology §3.7.4 改为"未做 elicited-weight 排名；第 5 章含示意性等权计算"。
5. **孤儿附录**：methodology 现引用附录 A/B/C/D/E（§3.3.1、§3.3.2、§3.4、§3.6、§3.7.1、§3.9）；"Appendix B/C of \citet{Smith2021}" 消歧；background §2.4 同步指向论文自身附录 C。

## P1 全部修复
6. `tab:repository-metrics` 按字母排序，caption 注明，加 ‡ 脚注（Newton 迁移）。
7. 图首次提及顺序与编号一致（先 ranking 后 heatmap）。
8. 附录 A：新增 **Mentions 列**（数据实读自 xlsx）；Excluded/Not selected/Measured 三状态定义；两处口径统一；新增 **Player/Stage**（6 次提及、活跃度不达标——GitHub 实查最后推送 2024-02）；GPMP2、ros2\_control 标 "---"（不在合并计数表中，注明经审查进入候选讨论）；KDL 行并入 Orocos KDL。
9. 附录 B 的 10 篇学术来源全部转 `\citet` 并入 bib（逐篇网络核实；**Brugali 2007 与 Iñigo-Blasco 2012 两篇的标题原表有误，已按真实标题更正**：“Trends in Robot Software Domain Engineering”、“Robotics Software Frameworks for Multi-Agent Robotic Systems Development”）。
10. `examples/`、`AI-Agent/` 内部路径全部改为 "supplementary project materials" 表述。
11. §3.2 域专家两段合并。
12. 推荐章扩充：三个量化 gap（user characteristics 1/28、coding standard 14/28、OS 版本 61%/依赖版本 68%）、自动化用途说明、仓库身份可读性（PhysX/OROCOS/Newton 为例）、未来研究记录评分依据；开头声明 RQ8/RQ9 部分性；garden-path 句改写；超宽节标题断行。
13. 威胁章新增：单一测量者无 inter-rater、impression 含 checklist 外观察、时间预算限深、Linux-only VM 平台偏差。
14. 命名统一：附录 A 用 Habitat / MoveIt!；OROCOS 角色 "Control framework"；AirSim 角色两处统一为 "Simulator (autonomous vehicles)"。
15. 模板计数：Maintainability 改 7 questions；Summary Information 17 项清单与附录 C 逐项对齐；附录 C 仓库指标补 open/closed issues。
16. notation.tex 增 $\mathit{RI}$、$n$；缩写表增 AIST、CVC、IIT、MREB、OMG、SLAM、TRI；SCC 给出正式展开。
17. ch6 CI 段落区分 26/28（CI/自动化测试）与 25/28（开发过程证据）。

## P2 处理情况
已修复：循环句、RQ2 措辞、applies→adapts、"(and relatively recent)"、Domain X 首次出现加注、business×2、picking、shape、"data is"、四模式长段拆为四段、"should be read" 两处变体、V8 顺序、"explicitly noted" 承诺改写（两处）、Gazebo 满分逐项依据段、MuJoCo I=7 解释（基于 CSV 记录的安装-验证不匹配）、AHP caption 中段换位说明、散点图 caption 注明 27 包、ch7 RQ 顺序说明、附录 F "An English rendering of the prompt"+贡献者计数口径注、`sample_chapter.tex`/`references_another.bib`/`figures/Sample/` 删除、modeling→modelling。Intro 图句作者已自行修改，未再动。
**有意跳过**：第 5 章章题保持原样（沿用系列论文 "Ranking Projects by Quality Measure" 表述）；ch4 ROS-Industrial 一句保留；MoveIt! 拼写约定保持。

## 第二轮（N 项）全部修复
- **N1 MI 误引**：改为 "installation instructions were found for only 16 of 29 packages and three packages could not be installed"（与 Ao 原文一致）。
- **N2** "peer-reviewed" 删除（Smith2021 经查仍为 arXiv 预印本）。
- **N3** MREB/MacREM 更正并双提。
- **N4 版面**：867pt vbox 根因是 `[H]`+双倍行距大浮动体——四张 28 行表改 `[p]`+`\singlespacing`，六张图改 `[htbp]`，ch3 选定软件表、ch4 参数表、附录 A longtable、附录 B 三表同步处理；最终 **0 vbox**。
- **N5 文献**：Dong2021→**Smith2024MI**（arXiv:2405.12171，网络核实——是预印本不是期刊，原 "Manuscript" 表述删除）；Weiss1997→**Weiss1998**（LNCS 1429, pp. 214–222，核实）；全部作者名统一 "Smith, W. Spencer" 形式；Seismology 补页码 755–788（核实）；Acton 条目改指 HPC-BP 系列页（2026-05-20 活动核实）；新增 9 条 survey 条目（全部网络核实；Žlajpah/Kargar 未查到可靠 DOI，故不填，宁缺毋错）；两个 key 改名已全文同步。
- **N6** 160→173 person-hours（两处，goal 表述保留）。
- **N7** 5 处 ≥18pt hbox 全消；`\pdfminorversion=7` 已加（图 PDF 版本警告消除）。
- **N8** 附录 F 贡献者口径注（311/116 vs 333/138）。
- **N9** 候选池规模写明 **295**——并修正本报告第二轮的一个错误假设（"63" 是附录 A 行数，不是池子大小）。

## 第三轮 post-fix review（2026-06-12）

修复完成后又做了一遍残留扫描（旧引用 key、`examples/` 路径、MacREM、"peer-reviewed"），**发现并修复了第二轮漏掉的 2 处**：`methodology.tex` §3.3.3 还有一处 "peer-reviewed methodology"（改为 "original methodology"）；`appendixD.tex` 末尾还有一处 `examples/...` 字面路径（改为 supplementary-materials 表述并交叉引用附录 A）。除此之外未再发现残留。

**CSV 改动与图的关系（明确结论）**：本次对 `summary.csv` 的 5 处修复（第 29/84/86/93/81 行）均不涉及 impression 分数、stars、forks、status 或包名——即六张既有图的全部输入。修复后用 `export_figs.py` 重新导出比对，与论文中的 PDF 仍仅差字体子集名/时间戳（1–6 字节），**六张旧图无需也未被替换**。

**新增图表**：应作者要求评估后新增一张 `fig_key_indicators`（第 5 章 §5.11，`fig:key-indicators`）——跨类别的 14 项关键模板指标覆盖率条形图（按覆盖率升序），可视化论文的核心发现"实用工件接近 100\%、形式化工件骤降至 50\%/4\%"。数据全部复述自论文表 5.2/5.3/5.6/5.7/5.8 与 §5.6 的 user-characteristics 结果；DomainX 侧同步新增 `charts.key_indicators`、`export_figs.py` 的 `KEY_INDICATORS` 清单、`indicators.csv` 的 Usability 行（1/28=4\%），并已纳入 `test_charts.py` 头less测试（9/9 通过）。加入新图后重新编译：**176 页，0 undefined，0 vbox**。

## 留给作者的事项
1. 标题页 `\principaladviser{Spencer Smith\\Matthew Giamou}`——确认 Giamou 是否署名为 co-supervisor。
2. Abstract / Lay Abstract / Acknowledgements / Declaration 为代拟稿，请按个人口吻润色；submitdate 提交时确认。
3. B 类分数（Gazebo 全 10、OpenRAVE I=8、MORSE I=9、AirSim M=8 等）均**未改动**——已补解释性文字，是否复核分数由你决定。
4. dedication 如需保留，请填写个人内容后恢复 main.tex 中的 `\include{dedic}`。
5. 附录 F 的 prompt 现表述为 "An English rendering"——若原 prompt 即英文逐字稿，请改回 "reproduced verbatim"。
