
#
# This special expression should be built into ec probably
#
define EXPR
  [ result |
      # Find everything everwhere
      walk(data, [thing_path, thing_value])

      # Pick out items (presumably rules) starting with "check_"
      startswith(thing_path[count(thing_path) - 1], "check_")

      # Assemble a "code" by putting dots between the path items
      # Remove the "check_" prefix to make it prettier
      code := concat(".", array.concat(
         array.slice(thing_path, 0, count(thing_path) - 1),
         [trim_prefix(thing_path[count(thing_path) - 1], "check_")]))

      # Add the code to help distinguish one rule from another in output
      result := object.union(thing_value, {"code": code})
  ]
endef

export EXPR

# Just hacking at this stage
go:
	@opa eval "$${EXPR}" -d ./policy -i ./samples/input.json -f pretty

ci: quiet-test fmt-check

quiet-test:
	@opa test ./policy

test:
	@opa test ./policy -v

live-test:
	@opa test ./policy -v -w

fmt:
	@opa fmt ./policy --list
	@opa fmt ./policy --write

fmt-check:
	@opa fmt ./policy --list | xargs -r -n1 echo 'FAIL: Incorrect formatting found in'
	@opa fmt ./policy --list --fail >/dev/null 2>&1
