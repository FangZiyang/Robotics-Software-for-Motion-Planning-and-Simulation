# summary.csv 真伪核验 + DomainX 图表核验报告
claude 做的验证
**日期：** 2026-06-10
**方法：**
1. `summary.csv` 全部 140 行 ↔ 论文各表逐格比对；
2. 论文中的派生统计（均值/中位数/计数/区间）全部重算；
3. 用 GitHub API 实测 **29 个仓库**的 stars/forks/watchers/archived/最后提交（2026-06-10 实时值 vs 2026-05 快照），另查 BitBucket API（ODE）、AirSim README、packages.ubuntu.com；
4. `E:\coding\DomainX` 图表代码审查：`ahp.py` ↔ 后端 `library_metric_values/views.py::AHPCalculations` 逐行对照；用工具自带 venv 重算 Mean/AHP/Q-Rank/S-Rank/Δ；
5. 用 `export_figs.py` **重新生成全部 6 张图**，与论文 `figures/*.pdf` 做解压后逐流比对。

**本报告只记录发现，未改动任何文件。**

---

## 一句话结论

**数据是真实的，图是对的。** 所有可在线核验的数字（28 包的 stars、forks、watchers、commit 数、最后提交日期、版本号）全部与 GitHub/BitBucket 实测吻合；6 张图与数据、论文表格三方一致，AHP 算法移植正确。需要处理的问题集中在三类：**①3 个仓库的"身份/口径"问题（AirSim、Newton、OROCOS）需要在论文里加 caveat；②impression 分数与记录证据脱钩（尤其 Robustness 一节的解释与 CSV 矛盾）；③若干 CSV 卫生问题。**

---

## ✅ 已验证为真实的部分

### 1. GitHub 指标抽查（2026-06-10 实时 vs CSV 2026-05 快照）— 29/29 命中

| 仓库 | CSV stars | 实时 stars | CSV 最后提交 | 实测 | 判定 |
|---|---|---|---|---|---|
| microsoft/AirSim | 18,159 | 18,230 | 2026-03-15 | **2026-03-15 精确命中**（提交内容 "stats"） | ✓ |
| bulletphysics/bullet3 | 14,465 | 14,531 | 2025-10-21 | pushed 2025-10-22 | ✓ |
| carla-simulator/carla | 13,941 | 14,052 | — | — | ✓ |
| google-deepmind/mujoco | 13,440 | 13,826 | — | — | ✓ |
| ros2/ros2 | 5,475 | 5,610 | — | — | ✓ |
| NVIDIA-Omniverse/PhysX | 4,532 | 4,596 | — | — | ✓ |
| cyberbotics/webots | 4,345 | 4,406 | — | 仓库创建日 = CSV initial release（2018-11-05）精确命中 | ✓ |
| RobotLocomotion/drake | 4,025 | 4,073 | — | — | ✓ |
| gazebosim/gz-sim | 1,337 | 1,375 | — | — | ✓ |
| moveit/moveit2 | 1,803 | 1,846 | 2026-03-23 | commit 总数 9,462 vs 实测 9,465 | ✓ |
| rdiankov/openrave | 801 | 805 | 2024-08-16 | 默认分支最后提交 **2024-08-16 精确命中** | ✓ |
| uzh-rpg/flightmare | 1,353 | 1,374 | 2023-05-15 | commit 总数 139 **精确命中** | ✓ |
| odedevs/ode (BitBucket) | n/a | — | 2026-04-14 | BitBucket API：**2026-04-14 精确命中** | ✓ |
| 其余 16 个仓库 | — | — | — | stars/forks/watchers 全部在 ±1 月自然增长范围内 | ✓ |

commit 总数抽查：gz-sim 7,500→实测 7,525；Drake 34,786→34,875；Flightmare 139→139；moveit2 9,462→9,465；JulioJerez/newton-dynamics 17,755→17,965。**全部吻合**。版本号抽查：OMPL `2.0.0`（真实存在，2026-04-06 发布——在我训练数据之后，特意查证为真）、PhysX 标签 `ovphysx-0.3.7`（真实存在）、ODE 0.16.6、Webots R2025a 均符合。

### 2. 论文派生统计全部复算通过

- 开发者数中位数 128.5（=YARP 125 与 MRPT 132 的均值）✓；范围 6（CoppeliaSim/Flightmare）–598（MoveIt!）✓
- commit 总和 >240,000（实算 242,490）✓；stars 中位数 ≈2,050（实算 2,047）✓
- % comments 均值 13.2%（27 包，实算 13.198）✓；% issues closed 均值 79.1 / 中位数 82.0（实算 79.10 / 81.95）✓
- 安装步数 1–11、中位数 2 ✓；额外依赖 0–10、中位数 1 ✓；"9 个一步安装""10 个零依赖""MuJoCo/Simbody/MORSE 两者兼得"逐包核对 ✓
- Windows 24 / macOS 23 / Linux 27 ✓；alive 24 / dead 4 ✓；自动化测试 26、断言 23、文档生成器 12、三者兼备 10（名单逐包核对）✓
- 编码规范 14 包名单逐包核对 ✓；教程输出 25/23 及 5 个例外名单 ✓

### 3. 安装步骤的独立旁证

附录 F 的 AI agent 试验独立复现了 PyBullet 与 MuJoCo 的安装（各 1 步 pip），与 CSV 的 "1, Ubuntu/Linux" 一致 ✓。ODE 安装文档过时（2006 年、GNU make/VC6）的记录与 ODE 官网现状一致，支撑 I=4 ✓。MuJoCo I=7 有记录在案的理由（pip 安装后 `particle_test.py` file-not-found，安装与测试不匹配）✓。

### 4. DomainX 图表核验 — 全部通过

- **算法忠实性**：`streamlit_charts/ahp.py` 与后端 `views.py::AHPCalculations`（A_jk = min(9, x−y+1) 及倒数、列归一化、行均值、权重归一加权和）逐行一致 ✓。
- **数据链路**：`data/quality_scores.csv`、`packages.csv`、`indicators.csv` ↔ `summary.csv` ↔ 论文表格三方逐格一致 ✓。
- **数值复算**：Mean 列 = 9 项行均值（28/28）✓；Q-Rank/S-Rank/Δ 全表复算一致（含并列同名次规则）✓；等权 AHP 前六名 **Gazebo, Drake, MoveIt!, Pinocchio, ROS 2, OMPL**，与论文图 caption 列出的顺序逐字一致 ✓；全局优先级和=1（caption "sum to one" 属实）✓。
- **箱线图 caption 复核**：九类中位数全在 7–8 之间；只有 Installability 与 Maintainability 的最小值低到 4——caption 的两个断言均与数据相符 ✓。
- **PDF 一致性**：重新生成的 6 张图与论文 `figures/` 中的 PDF，**绘图内容流完全一致**；唯一差异是 PDF 内嵌字体子集的随机命名前缀（`name` 表）与生成时间戳（`head` 表）——即视觉上逐像素同源 ✓。

---

## ⚠️ A 类：建议在论文中处理的发现

### A1. Surface Robustness 的解释与 CSV 直接矛盾（最重要）

`measurement_results.tex:147` 写道：*"most packages either pass both checks **or pass one of two**, resulting in similar scores"*。但 CSV（第 65/66 行）显示：**28/28 全部通过第一项检查；第二项 25 个通过、3 个 n/a——没有任何一个包"只过一项"**。也就是说，所有包的记录证据完全相同，但 robustness impression 却从 5（GraspIt!）到 10（Gazebo）不等。

同样的"证据相同、分数有别"也出现在 Surface Reliability（26 个包同为"未损坏"，分数 6–10）和 Surface Understandability（除编码规范外所有检查项 28/28 同答案，分数 5–10）。这意味着 impression 分数包含了 checklist 之外的判断。**建议**：
1. 修正 L147 那句与数据矛盾的解释；
2. 在 §3.7.1 或威胁章明确说明 impression 分还吸收了未列入表格的观察（文档质量、错误信息质量、安装体验等），否则考官拿 `summary.csv` 一对就会发现分差无记录依据。

### A2. AirSim："alive" 字面成立，但官方已宣布停更——M=8 难以辩护

实测确认（出乎我意料）：仓库 **没有** archive（archived=false，issues 开放 725 个），最后默认分支提交确为 **2026-03-15**，CSV 完全真实。但最近三次提交是 2026-03-15 "stats"、2025-05-15 "Update README.md"、2022-07-21 "Update README.md"——README 自 2022 年起挂着官方公告：*"no further updates will be made, effective immediately"*（原文在仓库 README "AirSim announcement" 一节）。CSV 年度提交 [238, 0, 0, 1, 1] 也印证开发停在 2022。

- 论文 ch4 (`selected_software_commonality.tex:33`) 的 caveat 方向正确，**建议补充引用 README 原话**作为证据，并指出 18 个月规则在这里命中的只是 README 级提交；
- **Maintainability=8**（与活跃维护的 Webots/MRPT 同分）与"官方宣布永久停更"的事实摆在一起很难答辩——建议给出理由或在 §5.7/§5.1 加 AirSim 专属 caveat（类似 PhysX 段）；
- CSV 第 84 行写 "GitHub Issues — **now archived and read-only**" 与 API 实测（archived=false、issues 开放）矛盾，**这句是 CSV 里错的部分**，建议改掉。

### A3. Newton Dynamics：测的是 2026 年 1 月才创建的个人仓库，stars=24 严重低估社区规模

实测：`JulioJerez/newton-dynamics` 创建于 **2026-01-16**（完整迁移了 17,755 个提交的历史，活跃开发中）；原官方仓库 `MADEAPPS/newton-dynamics` 拥有 **1,020 stars**，最后推送恰为 2026-01-17——即开发者在 2026 年 1 月把开发迁到了个人账号。CSV 选新家是对"当前开发"的合理选择，但：

- `measurement_results.tex:329` "from 24 (OpenRTM-aist, **Newton Dynamics**)"、Δ 表（S-rank 26、Δ=−1）和 `fig_quality_vs_popularity` 把 Newton 画在流行度最底部——**用 5 个月新仓库的 star 数代表了一个 20 年项目的社区关注度**。若按老仓库 1,020 stars，Newton 的 S-rank ≈20、Δ≈−7。
- **建议**：像 PhysX 一样给 Newton 加一句仓库迁移 caveat（表 5.9 注释 + §5.13"Consistently low"那句），否则"GraspIt! 与 Newton 在两个指标上都垫底"的论述有被推翻的风险。

### A4. OROCOS：实测对象是 KDL 子仓库，不是整个 OROCOS

CSV 源码 URL 与实测 stars（879 ↔ 实时 881）确认测的是 `orocos/orocos_kinematics_dynamics`（**KDL，运动学库**）。但论文把 OROCOS 描述为 "Real-Time Toolkit + KDL"（`selected_software_commonality.tex:75`），CSV 用途栏更列了 RTT/KDL/BFL/OCL 四件套。18,063 行代码、1,229 commits、"alive" 都只是 KDL 的属性（RTT 本体多年不活跃）。**建议**：在表 5.9 注释或 §5.1 写明 "OROCOS 的测量基于 orocos_kinematics_dynamics 仓库"，与 ROS 2 的多仓库说明并列。

### A5. YARP 的错误信息说法无数据支撑

`measurement_results.tex:136`：*"In both cases, a descriptive error message was displayed"*。CSV 第 29 行：OpenRAVE=yes，**YARP=n/a**。要么补记 YARP 的实际情况，要么把论文改成只对 OpenRAVE 作此声明。

### A6. "参数顺序"检查项整行空白

CSV 第 105 行（"Parameters are in the same order for all functions?"）**28 列全部空白**。但方法论 §3.7.1 和附录 C 都把它列为 Surface Understandability 的 8 问之一。要么补测，要么在文中注明该项未测（并把"8 questions"相应调整）。

---

## ⚠️ B 类：分数合理性 vs 线上口碑（定性判断，决定权在你）

| 包 | 疑点 | 对照证据 | 建议 |
|---|---|---|---|
| **Gazebo 九项全 10（均分 10.0）** | 该方法学系列没有先例——MedImaging 论文原话：*"the separation between the top performers and the others is not extreme"*；且 Gazebo 的 robustness/reliability **记录证据与 Drake 完全相同**（都全过），却 10 vs 9 | 见 A1 | 给每个 10 一句证据（CI、教程、release 流程……），或软化个别项；答辩必问 |
| **OpenRAVE I=8** | 安装时唯一 broke 的两个包之一 + 社区公认难装 + dead 状态，却比 Drake/CARLA(7) 高 | CSV 第 31 行只记 "3, Linux" | 写明 3 步用的安装途径（源码 or 二进制），或复核该分 |
| **MORSE I=9（1 步安装）** | `morse-simulator` 包在现行 Ubuntu（jammy/noble）**已不存在**（packages.ubuntu.com 实查无结果）；1 步安装只在老发行版上成立 | 项目 2022 年起无提交 | 在测量记录/正文写明所用发行版与安装途径，否则不可复现 |
| **AirSim 全 8** | 见 A2 | README 停更公告 | 加 caveat 或调整 |
| **MuJoCo I=7** | 1 步 pip + 0 依赖却只有 7，低于 dead 的 MORSE(9) | CSV 第 38 行有记录理由（安装-测试不匹配） | 可辩护；建议把这个理由写进 §5.2（目前只解释了 ODE/PhysX 的低分） |

> 其余高低分与口碑方向基本一致：Drake/ROS 2/OMPL/Pinocchio 高分、GraspIt!/Newton 文档薄弱低分、ODE 安装文档过时（官网 2006 指南，实查属实）、PhysX 构建文档难找（CSV 留有链接证据）。

---

## ⚠️ C 类：CSV 卫生问题（不影响论文数字，但审计会注意）

1. **第 29 行多余的 "yes"**：MuJoCo、AirSim、MORSE、GraspIt!、OpenRTM 在第 55 行明确"安装未损坏"，第 29 行（"若安装损坏，是否有错误提示"）却答了 yes（应为 n/a）。语义混乱，疑似记录的是"过程中出现过错误提示"。
2. **第 57 行**：Gazebo、MORSE 的"教程是否损坏"= n/a（其余 26 个为 no）。论文写 "No package broke during initial tutorial testing"——n/a ≠ no，建议补成 no 或说明。
3. **ROS 2 的 0 值**：code lines=0、files=0、%comments=0.00%。论文已正确转写为 "---"，但 CSV 里存 0 容易被当成实测零，建议改成 n/a。
4. **Newton 版本号 "v4,03"**：逗号应为点（v4.03）。
5. **第 93 行表头损坏**：`How many code files are there? ( (0-9=0,`——括号/碎片残留。
6. **ODE 已挂搬迁通知**：BitBucket 2026-04-14 那次提交内容就是 "Adding relocation notice to the README.md"（另有 2026-03 的 ARM64/Emscripten 真实修复，支持 alive(low) 分类 ✓）。未来复测时 BitBucket 仓库可能失效，建议测量记录里记一笔。
7. **AirSim "archived and read-only"**（第 84 行）：与 API 实测矛盾，见 A2。

---

## 图表的两个小建议（非错误）

1. **AHP 图 vs 均值排名的中段换位**：等权 AHP 与均值排序在 15 个位置不同（如 AHP 中 MORSE 排在 DART 之前、OpenRAVE 在 CARLA 之前；并列 8.7 的四家顺序也由 AHP 定）。论文只声明 "agree at the top"（属实），但细心的读者把图 5.4 与表 5.10 对照会发现中段不一致——建议在 caption 或正文补半句"中段顺序存在小幅换位"。
2. **`packages.csv` 的 Role 列**与论文表 3.2 个别不一致（Project Chrono/SOFA 标成 "Simulator"、GraspIt! 标成 "Planning & manipulation"）。该列未用于论文任何一张图（仅 app 内筛选），无实际影响，顺手对齐即可。

---

## 证据来源

- GitHub REST API（`gh api repos/...`，2026-06-10）：29 个仓库的 stars/forks/watchers/archived/pushed_at/created_at/commit 总数/最近提交
- AirSim README（`gh api repos/microsoft/AirSim/readme`）：停更公告原文
- BitBucket API：`odedevs/ode` 最近提交（2026-04-14 relocation notice）
- packages.ubuntu.com：morse-simulator 无结果
- OMPL release `2.0.0`（2026-04-06）、PhysX 标签 `ovphysx-0.3.7`：GitHub releases/tags API
- `examples/journal-medimaging-ao.md`：MedImaging 顶部分差描述原话
- 本地复算与图重生成：`E:\coding\DomainX\streamlit_charts`（.venv python；`export_figs.py` 输出至临时目录后与 `Ik_paper/figures` 比对）

---

# 修复记录（2026-06-12，已获作者授权执行；供 codex review 对照）

## A 类处理结果
- **A1（robustness 解释与 CSV 矛盾）**：`measurement_results.tex` §5.5 的解释句改写为与 CSV 一致（"全部通过两项检查；分差来自 impression calculator 吸收的更广观察"）；`methodology.tex` §3.7.1 新增 impression 含 checklist 外观察的说明；威胁章 Reliability 节补充主观性威胁；推荐章建议未来研究记录每个评分的依据。
- **A2（AirSim）**：ch4 caveat 补引 README 官宣原话（"no further updates will be made, effective immediately"）并指出 2022 后提交均为 README 级；`summary.csv` 第 84 行错误的 "now archived and read-only" 更正为 "development ended in 2022 per the repository README announcement, tracker still open"（与 API 实测 archived=false、issues 开放一致）。**M=8 等分数未改**（B 类，作者定夺）。
- **A3（Newton 仓库迁移）**：表 5.9 stars/forks 加 ‡ 脚注（2026-01 迁移、原仓库约 1,000 stars as of June 2026）；§5.1 新增仓库身份 caveat 段；§5.12 stars 叙述与 §5.13 "Consistently low" 段补充该 caveat 及对 S-rank 的影响说明。
- **A4（OROCOS=KDL）**：§5.1 caveat 段 + 表 5.9 注明测量对象为 `orocos_kinematics_dynamics`（KDL）仓库。
- **A5（YARP 错误信息）**：论文 §5.4 改为 "OpenRAVE 显示了错误信息，YARP 的记录未包含错误输出"；CSV 第 29 行清理：5 个与第 55 行矛盾的多余 "yes"（MuJoCo/AirSim/MORSE/GraspIt!/OpenRTM）改为 n/a，YARP 由 n/a 改为 **unclear**（安装确实损坏但未记录错误输出——不造数据）。
- **A6（参数顺序整行空白）**：方法论的 understandability 计数保持 8 问（与模板一致），但 §5.10 明确注明该项未在测量中记录、分数基于其余检查。**CSV 第 105 行保持空白**——不编造测量值。

## B 类处理结果（分数一律未动）
Gazebo 满分：§5.11 新增逐项记录依据 + "不等于软件完美" 限定。MuJoCo I=7：§5.2 写入 CSV 记录的安装-验证不匹配理由。MORSE/OpenRAVE 安装路径：以威胁章新增的 "Linux VM 单平台 + 安装路径时效性" 段覆盖。AirSim：见 A2。**是否复核任何分数由作者决定。**

## C 类处理结果
- C1 ✓（row 29，见 A5）；C2 **不动**（row 57 的 n/a 与论文表述不冲突）；C3 ✓ ROS 2 的 %comments 与 code-files 由 0/0.00% 改为 n/a（row 86/93，论文本就印 "---"）；C4 ✓ "v4,03"→v4.03；C5 ✓ row 93 表头修复为 "(number)"；C6 ODE 搬迁通知未写入 CSV（复测时注意 BitBucket 仓库可能失效）；C7 ✓（见 A2）。

## 图表处理结果
- **六张图未重新生成、也无需重新生成**：图的全部输入（`quality_scores.csv` 的 28×9 分数/Mean/Status、`packages.csv` 的 Stars/QMean/QRank/SRank/Delta）在本次修复中一项未改；修复后重新导出并与 `Ik_paper/figures` 比对，仍仅差内嵌字体子集名/时间戳（1–6 字节），与修复前的验证结论一致。
- `packages.csv` 的 Role 列三处对齐论文表 3.2（GraspIt!/Project Chrono/SOFA）——该列只用于 app 内筛选，不进入任何导出图。
- 图的两个小建议已落实到论文侧：AHP 图 caption 增加中段换位说明；散点图 caption 注明均值/中位数按 27 包计算。

## 最终验证
完整 Docker 构建（pdflatex→bibtex→pdflatex×2）：**176 页；BibTeX 0 警告；0 undefined references/citations；0 Overfull \vbox**；剩 3 处修复前即存在的 11.6–18.5pt 轻微 hbox 超宽。
