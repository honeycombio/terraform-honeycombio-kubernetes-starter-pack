####################################################
# Create Dataset to Contain all Required Columns
####################################################
resource "honeycombio_dataset" "new-dataset" {
  count       = var.create_dataset ? 1 : 0
  name        = var.dataset_name
  description = "This dataset was created to ensure that all necessary columns exist for derived column and query creation"
}

####################################################
# Create Required Columns for DC's and Queries
####################################################
locals {
  new_columns = {
    "metrics.filesystem.usage"       = "float",
    "metrics.filesystem.available"   = "float",
    "metrics.memory.usage"           = "float",
    "metrics.cpu.usage"              = "float",
    "metrics.cpu.utilization"        = "float",
    "metrics.uptime"                 = "float",
    "label.app.kubernetes.io/name"   = "string"
    "k8s.node.name"                  = "string",
    "k8s.pod.name"                   = "string",
    "metrics.network.bytes.receive"  = "float",
    "metrics.network.bytes.send"     = "float",
    "metrics.network.errors.receive" = "float",
    "metrics.network.errors.send"    = "float",
    "status.phase"                   = "string",
  }
}

resource "honeycombio_column" "new-columns" {
  count   = var.create_columns ? length(local.new_columns) : 0
  name    = keys(local.new_columns)[count.index]
  type    = values(local.new_columns)[count.index]
  dataset = var.dataset_name
  depends_on = [
    honeycombio_dataset.new-dataset
  ]
}

####################################################
# Create Derived Columns for the Env or Dataset
####################################################
# module "derived_columns" {
#   source             = "./modules/derived_columns"
#   dataset_name       = var.dataset_name
#   include_variable_1 = var.include_variable_1
#   include_variable_2 = var.include_variable_2

#   depends_on = [
#     honeycombio_dataset.new-dataset,
#     honeycombio_column.new-columns
#   ]
# }

####################################################
# Create Saved Queries for For Boards
####################################################
module "queries" {
  source           = "./modules/queries"
  dataset_name     = var.dataset_name
  query_time_range = var.query_time_range

  depends_on = [
    honeycombio_dataset.new-dataset,
    honeycombio_column.new-columns
  ]
}

####################################################
# Create Boards Using Saved Queries
####################################################
module "boards" {
  source                            = "./modules/boards"
  dataset_name                      = var.dataset_name
  node_utilization_id               = module.queries.node_utilization_id
  node_utilization_annotation_id    = module.queries.node_utilization_annotation_id
  pod_cpu_utilization_id            = module.queries.pod_cpu_utilization_id
  pod_cpu_utilization_annotation_id = module.queries.pod_cpu_utilization_annotation_id
  node_fs_utilization_id            = module.queries.node_fs_utilization_id
  node_fs_utilization_annotation_id = module.queries.node_fs_utilization_annotation_id
  network_health_id                 = module.queries.network_health_id
  network_health_annotation_id      = module.queries.network_health_annotation_id
  cluster_size_id                   = module.queries.cluster_size_id
  cluster_size_annotation_id        = module.queries.cluster_size_annotation_id
  application_health_id             = module.queries.application_health_id
  application_health_annotation_id  = module.queries.application_health_annotation_id
  pods_not_running_id               = module.queries.pods_not_running_id
  pods_not_running_annotation_id    = module.queries.pods_not_running_annotation_id

  depends_on = [
    honeycombio_dataset.new-dataset,
    honeycombio_column.new-columns,
    module.queries
  ]
}
