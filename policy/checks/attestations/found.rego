package attestations

import rego.v1

import data.lib.ec

check_input_key_present := {
	"description": "The expected attestations key was found in the input",
	"result": _attestations_key_present,
}

check_found := {
	"description": "At least one attestation was found in the input",
	"result": _attestation_present,
}

_attestations_key_present := ec.pass_result if {
	input.attestations
} else := ec.fail_result("Key 'attestations' not found in input", [])

_attestation_present := ec.pass_result if {
	count(input.attestations) > 0
} else := ec.fail_result("Expecting at least one attestation", [])
