# thread-rel-backup-probe

`thread-rel-backup-probe` explores reliability with a small Solidity codebase and local fixtures. The technical goal is to develop a Solidity command-oriented project for backup scenarios with deny and allow fixtures, explainable decision traces, and fixture-scale datasets.

## Purpose

I want this repository to be useful as a quick reading exercise: fixtures first, implementation second, verifier last.

## Thread Rel Backup Probe Review Notes

`stale` and `edge` are the cases worth reading first. They show the optimistic and cautious ends of the fixture.

## What Is Covered

- `fixtures/domain_review.csv` adds cases for budget pressure and failure width.
- `metadata/domain-review.json` records the same cases in structured form.
- `config/review-profile.json` captures the read order and the two review questions.
- `examples/thread-rel-backup-walkthrough.md` walks through the case spread.
- The Solidity code includes a review path for `budget pressure` and `recovery gap`.
- `docs/field-notes.md` explains the strongest and weakest cases.

## Implementation Notes

The core code exposes a scoring path and the added review layer uses `signal`, `slack`, `drag`, and `confidence`. The domain terms are `budget pressure`, `failure width`, `recovery gap`, and `runbook drift`.

The Solidity checks add a pure review lens and Foundry coverage.

## Command

```powershell
powershell -NoProfile -ExecutionPolicy Bypass -File scripts/verify.ps1
```

## Audit Path

The verifier is intentionally local. It should fail if the fixture score math, lane assignment, or language-specific test drifts.

## Limits

This remains a local project with deterministic fixtures. It does not depend on credentials, hosted services, or live data. Future work should add richer malformed inputs before widening the public API.
