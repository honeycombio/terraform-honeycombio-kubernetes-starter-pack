####################################################
# Define the Query Specification
####################################################
data "honeycombio_query_specification" "node_utilization" {
  calculation {
    op     = "MAX"
    column = "metrics.cpu.usage"
  }
  calculation {
    op     = "MAX"
    column = "metrics.memory.usage"
  }
  calculation {
    op     = "MAX"
    column = "metrics.uptime"
  }
  filter {
    column = "k8s.pod.name"
    op     = "does-not-exist"
  }
  breakdowns = [
    "k8s.node.name"
  ]
  order {
    op     = "MAX"
    column = "metrics.cpu.usage"
    order  = "descending"
  }
  time_range = 7200
}

####################################################
# Implement the Query Using the Specification
####################################################
resource "honeycombio_query" "node_utilization" {
  dataset    = var.dataset_name
  query_json = data.honeycombio_query_specification.node_utilization.json
}

################################################################
# Attach an Annotation to the Query to Explain What it Does
################################################################
resource "honeycombio_query_annotation" "node_utilization" {
  dataset     = var.dataset_name
  description = "Compares CPU usage across nodes to detect poor load balancing."
  name        = "Kubernetes Node CPU and Memory Usage"
  query_id    = honeycombio_query.node_utilization.id
}

####################################################
# Create Outputs for Use by Other Modules
####################################################
output "node_utilization_id" {
  value = honeycombio_query.node_utilization.id
}

output "node_utilization_annotation_id" {
  value = honeycombio_query_annotation.node_utilization.id
}
