package lib.ec_test

import rego.v1

import data.lib.ec

test_input_attestations if {
	"bacon" == ec.input_attestations with input.attestations as "bacon"
	["ham", "spam"] == ec.input_attestation_statements with input.attestations as [{"statement": "ham"}, {"statement": "spam"}]
}
