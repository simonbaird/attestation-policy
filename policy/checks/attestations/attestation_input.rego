package ec

import rego.v1

input_attestations := input.attestations

# The attestation objects created by EC include a statement key and a signatures key.
# Use this if you're wanting just the statements.
input_attestation_statements := [s | some att in input_attestations; s := att.statement]
