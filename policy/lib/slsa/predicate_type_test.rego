package lib.slsa_test

import rego.v1

import data.lib.slsa

test_has_predicate_type if {
	true == slsa.has_predicate_type({"predicateType": "foo"}, "foo")
	false == slsa.has_predicate_type({"predicateType": "foo"}, "bar")
}

test_has_slsa_predicate_type if {
	true == slsa.has_slsa_predicate_type({"predicateType": "https://slsa.dev/provenance/v0.2"})
	false == slsa.has_slsa_predicate_type({"predicateType": "https://slsa.dev/providence/v0.2"})
}

test_some_edge_cases if {
	false == slsa.has_predicate_type({"bacon": "foo"}, "foo")
	false == slsa.has_predicate_type("wat", "foo")
	false == slsa.has_predicate_type({}, "foo")
	false == slsa.has_predicate_type([], "foo")
}
