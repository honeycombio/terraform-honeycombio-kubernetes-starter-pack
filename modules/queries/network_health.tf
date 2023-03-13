####################################################
# Define the Query Specification
####################################################
data "honeycombio_query_specification" "network_health" {
  calculation {
    op     = "HEATMAP"
    column = "metrics.network.bytes.receive"
  }
  calculation {
    op     = "HEATMAP"
    column = "metrics.network.bytes.send"
  }
  calculation {
    op     = "MAX"
    column = "metrics.network.errors.receive"
  }
  calculation {
    op     = "MAX"
    column = "metrics.network.errors.send"
  }
  breakdowns = [
    "k8s.node.name",
    "k8s.pod.name",
  ]
  order {
    op     = "MAX"
    column = "metrics.network.errors.receive"
    order  = "descending"
  }

  time_range = var.query_time_range
}

####################################################
# Implement the Query Using the Specification
####################################################
resource "honeycombio_query" "network_health" {
  dataset    = var.dataset_name
  query_json = data.honeycombio_query_specification.network_health.json
}

################################################################
# Attach an Annotation to the Query to Explain What it Does
################################################################
resource "honeycombio_query_annotation" "network_health" {
  dataset     = var.dataset_name
  description = "Shows network utilization broken down by pods and errors if present."
  name        = "Network Health"
  query_id    = honeycombio_query.network_health.id
}

####################################################
# Create Outputs for Use by Other Modules
####################################################
output "network_health_id" {
  value = honeycombio_query.network_health.id
}

output "network_health_annotation_id" {
  value = honeycombio_query_annotation.network_health.id
}
