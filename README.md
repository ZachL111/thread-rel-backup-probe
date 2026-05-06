# thread-rel-backup-probe

`thread-rel-backup-probe` treats reliability as a local verification problem. The Solidity implementation is intentionally narrow, but the fixtures and notes make the behavior explicit.

## Thread Rel Backup Probe Checkpoints

Treat the compact fixture as the contract and the extended examples as a scratchpad. The code should stay boring enough that a change in behavior is obvious from the test output.

## What This Is For

The goal is to capture the core behavior in code and make the surrounding assumptions obvious. A reader should be able to run the verifier, open the fixtures, and understand why each decision was made.

## Case Study

`degraded` is the first example I would inspect because it lands on the `review` path with a score of -36. The broader file also keeps `degraded` at -36 and `surge` at 204, which gives the model a useful low-to-high spread.

## Architecture Notes

The core is a scoring model over demand, capacity, latency, risk, and weight. That keeps failure windows, retry budgets, and runbook checks in one explicit decision path. The threshold is 172, with risk penalty 5, latency penalty 4, and weight bonus 4. The Solidity project uses Foundry tests and pure contract functions so invariants are cheap to exercise.

## Useful Pieces

- Models failure windows with deterministic scoring and explicit review decisions.
- Uses fixture data to keep retry budgets changes visible in code review.
- Includes extended examples for runbook checks, including `surge` and `degraded`.
- Documents recovery paths tradeoffs in `docs/operations.md`.
- Runs locally with a single verification command and no external credentials.

## Local Workflow

```powershell
powershell -NoProfile -ExecutionPolicy Bypass -File scripts/verify.ps1
```

This runs the language-level build or test path against the compact fixture set.

## Quality Gate

```powershell
powershell -NoProfile -ExecutionPolicy Bypass -File scripts/audit.ps1
```

The audit command checks repository structure and README constraints before it delegates to the verifier.

## Project Layout

- `src`: primary implementation
- `test`: language test directory
- `fixtures`: compact golden scenarios
- `examples`: expanded scenario set
- `metadata`: project constants and verification metadata
- `docs`: operations and extension notes
- `scripts`: local verification and audit commands
- `foundry.toml`: Foundry project configuration

## Expansion Ideas

- Add malformed input fixtures so the failure path is as visible as the happy path.
- Split the scoring constants into a typed configuration object and validate it before use.
- Add a comparison mode that shows how decisions change when one signal is adjusted.
- Add one more reliability fixture that focuses on a malformed or borderline input.

## Scope

The fixture set is deliberately small. That keeps the review surface clear, but it also means the model should not be treated as a complete domain simulator.

## Tooling

Install Solidity and run the commands from the repository root. The project does not need credentials or a hosted service.
