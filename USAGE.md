<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 0.13 |
| <a name="requirement_honeycombio"></a> [honeycombio](#requirement\_honeycombio) | >= 0.13.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_honeycombio"></a> [honeycombio](#provider\_honeycombio) | >= 0.13.0 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_boards"></a> [boards](#module\_boards) | ./modules/boards |  |
| <a name="module_queries"></a> [queries](#module\_queries) | ./modules/queries |  |

## Resources

| Name | Type |
|------|------|
| [honeycombio_column.new-columns](https://registry.terraform.io/providers/honeycombio/honeycombio/latest/docs/resources/column) | resource |
| [honeycombio_dataset.new-dataset](https://registry.terraform.io/providers/honeycombio/honeycombio/latest/docs/resources/dataset) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_create_columns"></a> [create\_columns](#input\_create\_columns) | Whether to create columns used by the board queries | `bool` | `false` | no |
| <a name="input_create_dataset"></a> [create\_dataset](#input\_create\_dataset) | Whether to create a new dataset or use an existing one | `bool` | `false` | no |
| <a name="input_dataset_name"></a> [dataset\_name](#input\_dataset\_name) | The name of the dataset to use for derived columns and queries | `string` | `"kubernetes-metrics"` | no |
| <a name="input_query_time_range"></a> [query\_time\_range](#input\_query\_time\_range) | Query Default Time Range (in seconds). Defaults to 28800 (8 hours) | `number` | `28800` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_kubernetes_metrics_board_url"></a> [kubernetes\_metrics\_board\_url](#output\_kubernetes\_metrics\_board\_url) | Output variable definitions |
<!-- END_TF_DOCS -->