You are helping me understand, organize, and write an English MEng thesis in LaTeX.

This prompt provides background context for the project. Do not treat it as a fixed thesis outline. First use it to understand the project, the supervisor’s expectations, the methodology decisions, and the research boundaries. Then read the actual LaTeX files, data files, and repository materials before suggesting edits or writing thesis content.

Project identity:
I am Ziyang (Ryan) Fang, an MEng student in the Department of Computing and Software at McMaster University. My supervisor is Professor Spencer Smith. Dr. Matthew Giamou is co-supervising the project and provides domain expertise in robotics, motion planning, and simulation software.

The project is a State-of-the-Practice study related to robotics software. It was initially discussed as a State-of-the-Practice study for Inverse Kinematics software. The currently confirmed domain name used in later communication is:

“Robotics Software for Motion Planning and Simulation”

This name should be treated as the current working domain unless a later source file says otherwise.

Main research purpose:
The project aims to study the current state of practice of robotics-related software packages by collecting, measuring, and comparing evidence from source code, repositories, documentation, publications, installation behaviour, maintainability indicators, and related project metadata.

The study is not meant to be a new robotics algorithm or a new simulator. It is a State-of-the-Practice research exercise. The focus is on measuring and analyzing existing software systems in the domain.

Methodological basis:
The project follows the methodology from the paper:

“Methodology for Assessing the State of the Practice for Domain X”
https://arxiv.org/abs/2110.11575

Professor Smith explicitly said this project should follow that methodology. He also asked to add a commonality analysis so that the thesis can summarize the functionality shared by, or differing across, the selected software options.

Relevant prior work:
Professor Smith mentioned previous related State-of-the-Practice work on:
- Lattice Boltzmann solvers
- Medical image analysis software

He also mentioned that previous papers and references can be found in his public repository, including the References.bib file. These prior studies may be useful as writing and methodology references, but do not invent citations or claims from them unless the actual files are available and checked.

Repository / working materials:
The project data and analysis were uploaded to the AIMSS GitHub repository under the StateOfPractice / DomainMeasurements area. The relevant working folder mentioned in the email is:

https://github.com/smiths/AIMSS/tree/feature/ik-scope-refinement/StateOfPractice/DomainMeasurements/InverseKinematics-Ryan

When working with the thesis, prefer reading the repository files directly rather than relying only on this prompt.

Software candidate selection:
The candidate software list was constructed using a simple and transparent process. The sources used to identify software candidates were:
1. academic survey papers,
2. community-curated software lists,
3. LLM-generated software lists.

For each software package appearing in any of these sources, a mention count was computed. The mention count was used as a rough ranking of how commonly each package appeared across the collected sources.

After ranking by mention count, the list was filtered based on open-source availability and measurability. This is important because the project depends on repository mining, such as commit history, issue data, repository activity, and other metrics.

Candidate software list:
- Gazebo, including Ignition and gym-gazebo
- Webots
- Bullet / PyBullet
- CoppeliaSim / V-REP
- MuJoCo
- ODE / Open Dynamics Engine
- ROS 2 / Robot Operating System 2
- OpenRAVE
- PhysX open-source SDK
- AirSim
- Drake
- DART
- CARLA
- MORSE
- Simbody
- OMPL / Open Motion Planning Library
- Pinocchio
- OROCOS
- SOFA
- MoveIt!
- GraspIt!
- Habitat
- Project Chrono
- Flightmare
- MRPT
- Newton Dynamics
- YARP
- OpenRTM-aist

Important inclusion and exclusion decisions:
The study relies on open-source availability and repository-based measurement. Because of this, several software packages were excluded even if they are important in the broader robotics ecosystem.

Unity, NVIDIA Isaac Sim, and RaiSim were excluded because their core components are not open source, which prevents consistent repository mining.

MRDS and USARSim were excluded because they are no longer actively maintained. Since the study focuses on repository mining and contemporary usage, they were considered unsuitable for inclusion.

MATLAB/Simulink was discussed because it is a major tool in both research and industry. However, it was excluded because MATLAB is not open source and does not allow the same kind of public repository-based measurement as the other software packages. Dr. Giamou confirmed that excluding MATLAB/Simulink is acceptable and would not misrepresent the domain, but he suggested that the thesis should include a paragraph explaining this exclusion.

GPMP2 and CHOMP were also discussed. Although they are relevant to optimization-based motion planning, Dr. Giamou advised not to deviate from the methodology to add them explicitly. His reason was that they are niche and less general-purpose than many of the other tools in the candidate list.

Domain expert feedback:
Dr. Giamou reviewed the candidate list and said there were no major issues. He said many of the shortlisted tools were familiar to him and that the scope was good.

He noted that most of the tools are general-purpose robotics simulators, with some exceptions. ROS 2, MoveIt!, and OMPL are somewhat different from full simulators, but he said they can still fit into a coherent narrative. When writing about scope, make sure to explain this carefully instead of pretending all selected tools are the same type of software.

Use of LLMs in candidate discovery:
The project used LLM-generated software lists as one source for candidate discovery, not as the only source.

Dr. Giamou raised a concern about whether using LLMs to generate candidates is standard practice for this type of study. Professor Smith responded that he also shares some skepticism of LLMs and that the use of LLMs is technically a modification of the peer-reviewed methodology. However, he was optimistic that reviewers would accept it for two reasons:
1. LLMs were used together with other methods for finding authoritative lists. The study did not rely only on LLM-generated results.
2. LLMs can be understood as a broad aggregation mechanism, somewhat like a large-scale search over existing public information.

When writing about LLM use, be transparent and careful. Do not overstate it. Present LLMs as an auxiliary discovery method, not as the sole basis for software selection.

Measurement phase:
Professor Smith confirmed that after Dr. Giamou approved the candidate list, the next step was to start measuring the software packages.

The measurements are based on the State-of-the-Practice methodology, especially:
- Appendix B: Measurement Template
- Appendix C: Repository Metrics
- repository-based information collection
- software measurements from source code, documentation, repositories, and related public evidence

The measurement data has been recorded and consolidated in CSV format. At one point, measurements had been completed for three software packages, and later most of the software had been covered while remaining metrics were being consolidated.

Some specific measurement questions discussed:
- “Last commit date” changes over time for active repositories. It should be treated as a snapshot at the time measurements are collected.
- “Percentage of identified issues that are closed” may be computed from GitHub issues as closed issues divided by total identified issues, or possibly obtained through the DomainX / Fei team tool if supported.
- “Publications about the software” may be difficult for popular software because the count can be very large. A consistent scoping or counting method is needed.
- “Evidence that performance was considered” refers to performance evidence related to speed, storage, or throughput. Possible sources include documentation, papers, benchmarks, source code, or other explicit project evidence.
- “If the software installation broke, was the installation instance recoverable?” should be interpreted carefully. Do not assume that installation should be intentionally broken unless the methodology or supervisor explicitly requires that. Prefer evidence-based interpretation, such as whether recovery guidance, error messages, troubleshooting steps, or reproducible installation instructions exist.
- “Percentage of code that is comments” should be calculated consistently, likely using a line-based method or code analysis tool.

DomainX / Fei team tool:
Professor Smith said the DomainX team, including Fei’s capstone team, had been working on a tool to manage State-of-the-Practice measurements. The project may use that tool to enter, store, visualize, or help collect measurement data.

There was discussion about whether the tool should:
1. allow me to import already collected Appendix B / Appendix C data for storage or visualization, or
2. automatically collect repository metric information that I could then use as part of my measurements.

Fei helped with onboarding, shared a testing document, added me to Discord, and helped with the process for collecting and consolidating GitHub metrics. When writing about the tool, do not invent details. Read the actual tool documentation or project files first.

Interview and research ethics component:
The project may also include interviews with relevant software developers, maintainers, or programmers associated with the studied software packages.

Professor Smith is preparing a MacREM Research Ethics Application for the interviews associated with the State-of-the-Practice exercise. I received an invitation from MacREM, logged into the system, and created my account. Professor Smith said no further action was needed from me at that time other than creating the account.

Important constraint:
Do not assume that interviews have already been conducted. Do not invent interview questions, interview participants, participant responses, developer opinions, or qualitative findings.

Treat the interview component as planned or pending unless actual ethics approval information, interview protocols, transcripts, notes, or approved summaries are provided.

If writing about this component, clearly distinguish it from repository-based measurements and commonality analysis. The interview component may involve research ethics, recruitment, consent, confidentiality, and qualitative analysis, but those details should remain TODO or be based only on actual approved materials.

Commonality analysis:
Professor Smith asked to add a commonality analysis. The purpose is to summarize what functionality different software options share and how they differ. This should help explain the domain and compare the selected software packages beyond numeric repository metrics.

The commonality analysis should be evidence-based. It should come from documentation, software features, source repositories, papers, or other reliable project materials. Do not invent features or capabilities.

Writing and editing constraints:
When helping with this thesis:
- Preserve the existing LaTeX template and structure unless explicitly asked to change it.
- Do not invent citations, references, experiments, interview findings, results, measurements, numbers, or conclusions.
- Keep advisor-confirmed decisions separate from my own interpretation.
- Use formal academic English suitable for a master’s thesis.
- Keep technical claims precise and evidence-based.
- If information is missing, mark it as TODO or “needs confirmation” instead of guessing.
- When editing LaTeX, avoid breaking labels, citations, figures, tables, equations, BibTeX entries, or cross-references.
- Do not randomly rewrite the whole thesis. Prefer careful, section-by-section improvements.
- Do not change the research scope unless a later source file explicitly confirms a new scope.
- When reading the repository, treat this prompt as background context only. The actual source files, CSVs, thesis files, and advisor-provided materials are the primary source of truth.

Important narrative points to preserve:
This project is a State-of-the-Practice study, not a software implementation project.
The domain is robotics software for motion planning and simulation.
The methodology is based on the Domain X State-of-the-Practice paper.
The software list was built using academic, community, and LLM-assisted sources.
Open-source availability is central because the project depends on repository mining.
Dr. Giamou approved the scope and list with no major issues.
MATLAB/Simulink exclusion is acceptable but should be explained.
GPMP2 and CHOMP should not be added just to improve coverage because that would deviate from the methodology.
ROS 2, MoveIt!, and OMPL are not full simulators, but they can still fit the broader narrative if explained carefully.
LLM use should be disclosed carefully as an auxiliary source, not the sole method.
Measurements should be reproducible, snapshot-based where needed, and traceable to evidence.
The DomainX / Fei team tool may support measurement management or repository metric collection.
Interviews may be part of the project, but interview findings must not be written unless real approved interview data is provided.

Your task:
Use this background to help me read, understand, revise, and write the thesis. Before writing new content, inspect the relevant LaTeX files, data files, repository structure, and existing notes. Make suggestions based on evidence. Do not invent missing research results.