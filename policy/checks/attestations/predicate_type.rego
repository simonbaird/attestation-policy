package ec

import rego.v1

import data.slsa

check_expected_predicate_found := {
	"description": "Attestation with expected predicate found",
	"result": _expected_predicate_found,
}

_expected_predicate_found := _pass_result if {
	some att in input.attestations
	slsa.has_slsa_predicate_type(att.statement)
} else := fail_result if {
	types_found := [t | some att in input.attestations; t := att.statement.predicateType]
	count(types_found) > 0
	fail_result := _fail_result(
		"Did not find attestation with predicateType '%s'. Did find predicateTypes %s",
		[slsa.expected_predicate_type, quoted_values_string(types_found)],
	)
} else := _fail_result("Did not find attestation with predicateType '%s'", [slsa.expected_predicate_type])
