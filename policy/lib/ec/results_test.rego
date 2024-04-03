package lib.ec_test

import rego.v1

import data.lib.ec

test_status if {
	"fail" == ec.fail_result("", []).status
	"warn" == ec.warn_result("", []).status
	"pass" == ec.pass_result.status
}

test_reason if {
	"foo bar" == ec.fail_result("%s bar", ["foo"]).reason
	"42" == ec.warn_result("%d", [42]).reason
}
