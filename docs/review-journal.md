# Review Journal

I treated `thread-rel-backup-probe` as a project where the smallest useful behavior should still be inspectable.

The local checks classify each case as `ship`, `watch`, or `hold`. That gives the project a small review vocabulary that matches its reliability focus without claiming live deployment or external usage.

## Cases

- `baseline`: `budget pressure`, score 173, lane `ship`
- `stress`: `failure width`, score 202, lane `ship`
- `edge`: `recovery gap`, score 150, lane `ship`
- `recovery`: `runbook drift`, score 154, lane `ship`
- `stale`: `budget pressure`, score 213, lane `ship`

## Note

The useful failure mode here is a wrong decision on a named case, not a vague style disagreement.
