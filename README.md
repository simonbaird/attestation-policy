
# Attestation Policy

Experimenting with a new way of organizing rego rules for use with [Enterprise
Contract](https://enterprisecontract.dev/).

Goals:

* More reusable rego
* Less effort to display passing checks
* Easier to manage and extend

See also:

* [enterprise-contract/ec-policies](https://github.com/enterprise-contract/ec-policies/)
* [Rego](https://www.openpolicyagent.org/docs/latest/policy-language/)

## Notes

### Apr 3, 2024

* Currently using opa 0.63.0.
* Only trivial checks are defined so far.
* Some unit tests exist, but only for simple stuff.
* Likes:
    * It does produce nice output for passing checks without the need for
      opa inspect hoop jumping.
    * The idea of attempting to isolate/encapsulate the input format
      that ec produces, and use as much "generic" rego as possible.
    * The idea of freeing ourselves from conftest's deny/warn conventions/contstraints.
    * Smaller more composable building blocks maybe.
* Dislikes:
    * Despite everything the rego needed for a new check to be used by
      ec is not all that simple. There's still some explanation needed to
      explain to a policy author what they need to do. (But maybe we're better positioned to
      compose them from smaller pieces of rego that are simple and generic...)
* Neutral:
    * Currently it doesn't use rego metadata. Do we want to bring that back,
      e.g. for titles, descriptions solution text, etc?
* Next steps:
    * It will be interesting to try adding more complicated checks,
      and also adding unit testing for those checks.
    * Maybe the "do signature checks using rego builtins" idea could be
      introduced here.
