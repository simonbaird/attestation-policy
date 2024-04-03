package lib.str_test

import rego.v1

import data.lib.str

test_quoted_values_string if {
	"'foo', 'bar'" == str.quoted_values_string(["foo", "bar"])
	"'foo'" == str.quoted_values_string(["foo"])
	"" == str.quoted_values_string([])
}
