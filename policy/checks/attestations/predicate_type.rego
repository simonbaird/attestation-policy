package attestations

import rego.v1

import data.lib.ec
import data.lib.slsa
import data.lib.str

check_expected_predicate_found := {
	"description": "An attestation with the expected predicate was found",
	"result": _expected_predicate_found,
}

_expected_predicate_found := ec.pass_result if {
	some att in ec.input_attestation_statements
	slsa.has_slsa_predicate_type(att)
} else := fail_result if {
	types_found := [t | some att in ec.input_attestation_statements; t := att.predicateType]
	count(types_found) > 0
	fail_result := ec.fail_result(
		"Did not find attestation with required predicate type '%s'. Found predicate types %s",
		[slsa.expected_predicate_type, str.quoted_values_string(types_found)],
	)
} else := ec.fail_result("Did not find attestation with predicateType '%s'", [slsa.expected_predicate_type])
