####################################################
# Define the Query Specification
####################################################
data "honeycombio_query_specification" "pods_not_running" {
  calculation {
    op = "COUNT"
  }
  filter {
    column = "status.phase"
    op     = "!="
    value  = "Running"
  }
  filter {
    column = "status.phase"
    op     = "exists"
  }
  breakdowns = [
    "status.phase",
    "k8s.pod.name"
  ]
  order {
    op    = "COUNT"
    order = "descending"
  }
  time_range = var.query_time_range
}


####################################################
# Implement the Query Using the Specification
####################################################
resource "honeycombio_query" "pods_not_running" {
  dataset    = var.dataset_name
  query_json = data.honeycombio_query_specification.pods_not_running.json
}

################################################################
# Attach an Annotation to the Query to Explain What it Does
################################################################
resource "honeycombio_query_annotation" "pods_not_running" {
  dataset     = var.dataset_name
  description = "A count of pods that are not in the \"Running\" state."
  name        = "Pods not \"Running\""
  query_id    = honeycombio_query.pods_not_running.id
}

####################################################
# Create Outputs for Use by Other Modules
####################################################
output "pods_not_running_id" {
  value = honeycombio_query.pods_not_running.id
}

output "pods_not_running_annotation_id" {
  value = honeycombio_query_annotation.pods_not_running.id
}
