####################################################
# Define the Query Specification
####################################################
data "honeycombio_query_specification" "pod_cpu_utilization" {
  calculation {
    op     = "MAX"
    column = "metrics.cpu.usage"
  }

  calculation {
    op     = "MAX"
    column = "metrics.cpu.utilization"
  }

  filter {
    column = "k8s.pod.name"
    op     = "exists"
  }
  breakdowns = ["k8s.pod.name"]

  order {
    op     = "MAX"
    column = "metrics.cpu.usage"
    order  = "descending"
  }

  time_range = var.query_time_range
}

####################################################
# Implement the Query Using the Specification
####################################################
resource "honeycombio_query" "pod_cpu_utilization" {
  dataset    = var.dataset_name
  query_json = data.honeycombio_query_specification.pod_cpu_utilization.json
}

################################################################
# Attach an Annotation to the Query to Explain What it Does
################################################################
resource "honeycombio_query_annotation" "pod_cpu_utilization" {
  dataset     = var.dataset_name
  description = "Separately reports usage and utilization to show when a pod is struggling."
  name        = "Kubernetes Pod CPU Utilization"
  query_id    = honeycombio_query.pod_cpu_utilization.id
}

####################################################
# Create Outputs for Use by Other Modules
####################################################
output "pod_cpu_utilization_id" {
  value = honeycombio_query.pod_cpu_utilization.id
}

output "pod_cpu_utilization_annotation_id" {
  value = honeycombio_query_annotation.pod_cpu_utilization.id
}
