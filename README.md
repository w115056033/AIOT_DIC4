# AIOT_DIC4

📷 **本次提供的圖片**：請將截圖檔案放入本目錄，並用下方語法嵌入（範例）：
```markdown
![過程截圖](overleaf-screenshot.png)
```

🔗 **Overleaf 專案**：https://www.overleaf.com/project/6b06bc71056e29946462642e

TrailGuard TW: A Pre-Hike Decision Agent for Mountain Safety (A–F)

This project proposes **TrailGuard TW**, a pre-hike decision agent for Taiwan's mountain areas. It adopts a hybrid architecture where **"LLM is responsible for understanding and interpretation, and the Python engine is responsible for computation and verification"**, combined with a **Temporal Knowledge Graph** and **Hybrid RAG** to output a pre-hike decision package that is traceable, auditable, and correctable.

## Repository Structure

| File | Description |
|------|-------------|
| `main2.tex` | Main LaTeX source file (IEEEtran conference format, English version) |
| `README.md` | This file |

## Compilation

Compile with **pdfLaTeX**:

```bash
pdflatex main2.tex
pdflatex main2.tex
```

> Do **not** use XeLaTeX. The `xeCJK` package and all Chinese content have been removed so that the document compiles cleanly with pdfLaTeX.

## Abstract

The hiking population in Taiwan continues to grow, but mountain risks have not declined accordingly. Statistics from the National Fire Agency, Ministry of the Interior show that from 2015 to 2024, a total of 3,450 mountain accidents occurred nationwide, of which 1,263 cases (37%) were "lost on trail," making it the leading accident type. This paper proposes TrailGuard TW, a pre-hike decision agent for Taiwan's mountain areas, adopting a hybrid architecture where "LLM is responsible for understanding and interpretation, and the Python engine is responsible for computation and verification," combined with a Temporal Knowledge Graph and Hybrid RAG to output a pre-hike decision package that is traceable, auditable, and correctable. The study plans 120 evaluation cases, using CSR, FSR, EGR and other metrics to evaluate system performance in multi-constraint hiking planning tasks, with particular attention to reducing the "false sense of safety" (False-Safe Rate).

## Keywords

TrailGuard TW, mountain safety, pre-hike decision, LLM, Temporal Knowledge Graph, Hybrid RAG, constraint verification

## License

This project is part of the AIOT DIC4 coursework.

## Sync to GitHub & Overleaf

When you modify files in this project, use the provided sync scripts to push changes to both **GitHub** and **Overleaf** at once.

### Scripts

| Script | Platform | Usage |
|--------|----------|-------|
| `sync-all.ps1` | Windows PowerShell | `.\sync-all.ps1 "your commit message"` |
| `sync-all.sh` | Linux/macOS | `./sync-all.sh "your commit message"` |

### What the script does

1. `git add .`
2. `git commit -m "<message>"`
3. `git push origin master` (to `https://github.com/w115056033/AIOT_DIC4.git`)
4. `olcli push main2.tex --project 6b06bc71056e29946462642e` (to Overleaf)

### Prerequisites

- `git` installed and remote `origin` configured
- `olcli` (Overleaf CLI) installed and logged in (`olcli whoami`)
- Overleaf project ID: `6b06bc71056e29946462642e`

> `main2.tex` has removed `xeCJK` and all Chinese content. Compile with **pdfLaTeX**, not XeLaTeX.

### OpenCode skill

Skill definition: `.opencode/skills/sync-github-overleaf.md`