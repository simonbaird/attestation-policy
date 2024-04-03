package lib.ec

import rego.v1

# Format results in the way that ec expects them

fail_result(reason, reason_sprintf_params) := result if {
	result := {
		"status": "fail",
		"reason": sprintf(reason, reason_sprintf_params),
	}
}

warn_result(reason, reason_sprintf_params) := result if {
	result := {
		"status": "warn",
		"reason": sprintf(reason, reason_sprintf_params),
	}
}

pass_result := result if {
	result := {"status": "pass"}
}
