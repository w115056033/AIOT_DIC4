# AIOT_DIC4

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