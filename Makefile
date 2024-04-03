
#
# This special expression should be built into ec probably
#
define EXPR
  [ result |
      # Find everything everwhere
      walk(data, [check_path, check_result])

      # Pick out things (presumably rules) starting with "check_"
      startswith(check_path[count(check_path) - 1], "check_")

      # Inject the dotted path as the code to help distinguish one rule from another
      result := object.union(check_result, {"code": concat(".", check_path)})
  ]
endef

export EXPR

# Just hacking at this stage
go:
	@opa eval "$${EXPR}" -d ./policy -i ./samples/input.json -f pretty

# Beware it does break things by removing `:= true` in some places
fmt:
	@opa fmt ./policy --write
