package ec

import rego.v1

check_attestations_key_present := {
	"description": "Attestation key found in input",
	"result": _attestations_key_present,
}

check_attestations_present := {
	"description": "At least one attestation present",
	"result": _attestation_present,
}

_attestations_key_present := _pass_result if {
	input.attestations
} else := _fail_result("Key 'attestions' not found in input", [])

_attestation_present := _pass_result if {
	count(input.attestations) > 0
} else := _fail_result("Expecting at least one attestation", [])
