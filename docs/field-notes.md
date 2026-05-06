# Field Notes

I would read this project from the data inward: cases first, implementation second.

The domain cases cover `budget pressure`, `failure width`, `recovery gap`, and `runbook drift`. They sit beside the smaller starter fixture so the project has both a compact scoring check and a domain-flavored review check.

The widest spread is between `budget pressure` and `recovery gap`, so those are the first two cases I would preserve during a refactor.

The local verifier covers this data so the notes stay tied to code.
