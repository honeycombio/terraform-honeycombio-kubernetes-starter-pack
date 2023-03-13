####################################################
# Define the Query Specification
####################################################
data "honeycombio_query_specification" "node_fs_utilization" {
  calculation {
    op     = "P99"
    column = "metrics.filesystem.available"
  }
  calculation {
    op     = "P99"
    column = "metrics.filesystem.usage"
  }
  filter {
    column = "k8s.pod.name"
    op     = "does-not-exist"
  }
  breakdowns = [
    "k8s.node.name"
  ]
  order {
    op     = "P99"
    column = "metrics.filesystem.available"
    order  = "descending"
  }
  time_range = var.query_time_range
}


####################################################
# Implement the Query Using the Specification
####################################################
resource "honeycombio_query" "node_fs_utilization" {
  dataset    = var.dataset_name
  query_json = data.honeycombio_query_specification.node_fs_utilization.json
}

################################################################
# Attach an Annotation to the Query to Explain What it Does
################################################################
resource "honeycombio_query_annotation" "node_fs_utilization" {
  dataset     = var.dataset_name
  description = "Shows the node filesystem usage and available storage."
  name        = "Node Filesystem Utilization"
  query_id    = honeycombio_query.node_fs_utilization.id
}

####################################################
# Create Outputs for Use by Other Modules
####################################################
output "node_fs_utilization_id" {
  value = honeycombio_query.node_fs_utilization.id
}

output "node_fs_utilization_annotation_id" {
  value = honeycombio_query_annotation.node_fs_utilization.id
}
