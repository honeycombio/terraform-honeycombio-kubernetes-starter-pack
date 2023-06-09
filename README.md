# TERRAFORM HONEYCOMBIO KUBERNETES-STARTER-PACK

[![OSS Lifecycle](https://img.shields.io/osslifecycle/honeycombio/terraform-honeycombio-kubernetes-starter-pack?color=success)](https://github.com/honeycombio/home/blob/main/honeycomb-oss-lifecycle-and-practices.md)
[![CI](https://github.com/honeycombio/terraform-honeycombio-kubernetes-starter-pack/actions/workflows/test-terraform-module.yml/badge.svg)](https://github.com/honeycombio/terraform-honeycombio-kubernetes-starter-pack/actions?query=Test%20Terraform%20Module)

This module creates resources like FIXME in [Honeycomb](https://www.honeycomb.io) to kick off exploration

## Use

The minimal config is:

```hcl
module "explore-honeycombio-kubernetes-starter-pack" {
  source = "honeycombio/kubernetes-starter-pack/honeycombio"
}
```

Set the API key used by Terraform setting the HONEYCOMB_API_KEY environment variable.

```bash
export HONEYCOMB_API_KEY=$HONEYCOMB_API_KEY
```

Now you can run `terraform plan/apply` in sequence.

For more config options,
see [USAGE.md](https://github.com/honeycombio/terraform-honeycombio-kubernetes-starter-pack/blob/main/USAGE.md)
.

## Examples

Examples of use of this module can be found
in [`examples/`](https://github.com/honeycombio/terraform-honeycombio-kubernetes-starter-pack/tree/main/examples)
. We've
provided a build durations exploration example.

## Development

### Tests

Test cases that run against local code are
in [`tests/`](https://github.com/honeycombio/terraform-honeycombio-kubernetes-starter-pack/tree/main/tests)
. To set up:

1. Set the API key used by Terraform setting the HONEYCOMB_API_KEY environment variable.

2. `terraform plan` and `terraform apply` will now work as expected, as will
   `terraform destroy`.

3. Test cases also run as part of the pipeline.
   See [test-terraform-module.yml](https://github.com/honeycombio/terraform-honeycombio-kubernetes-starter-pack/blob/main/.github/workflows/test-terraform-module.yml)

### Docs

Docs are autogenerated via `./docs.sh`, and put
in [USAGE.md](https://github.com/honeycombio/terraform-honeycombio-kubernetes-starter-pack/blob/main/USAGE.md)
. Please
regenerate and commit before merging.

### Lints

We use [tflint](https://github.com/terraform-linters/tflint) and `terraform
fmt`, and enforce this with a [github action](.github/workflows/tflint.yml).

## Contributions

Features, bug fixes and other changes to this module are gladly accepted. Please open issues or a pull request with your
change.

All contributions will be released under the Apache License 2.0.
