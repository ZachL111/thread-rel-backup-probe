# Thread Rel Backup Probe Walkthrough

I use this file as a small checklist before changing the Solidity implementation.

| Case | Focus | Score | Lane |
| --- | --- | ---: | --- |
| baseline | budget pressure | 173 | ship |
| stress | failure width | 202 | ship |
| edge | recovery gap | 150 | ship |
| recovery | runbook drift | 154 | ship |
| stale | budget pressure | 213 | ship |

Start with `stale` and `edge`. They create the widest contrast in this repository's fixture set, which makes them better review anchors than the middle cases.

`stale` is the optimistic case; use it to make sure the scoring path still rewards strong signal.
