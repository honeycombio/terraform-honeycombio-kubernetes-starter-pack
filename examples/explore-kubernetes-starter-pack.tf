module "honeycombio-kubernetes-starter-pack" {
  source = "honeycombio/kubernetes-starter-pack/honeycombio"

  # In case you have multiple datasets with kubernetes metrics
  dataset_name = "__all__"

  # Changing the Query Time Range to 1 day
  query_time_range = "86400"
}