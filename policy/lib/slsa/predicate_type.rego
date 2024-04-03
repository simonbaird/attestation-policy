package lib.slsa

# Anything in lib should be 100% reusable with zero EC-isms

import rego.v1

expected_predicate_type := "https://slsa.dev/provenance/v0.2"

# Check the attestation statement has the expected predicate type
has_slsa_predicate_type(att) := true if {
	has_predicate_type(att, expected_predicate_type)
} else := false

# Check the attestation statement has a given predicate type
has_predicate_type(att, predicate_type) := true if {
	att.predicateType == predicate_type
} else := false
