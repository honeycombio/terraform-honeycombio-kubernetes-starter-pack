####################################################
# Define the Query Specification
####################################################
data "honeycombio_query_specification" "application_health" {
  calculation {
    op     = "SUM"
    column = "metrics.filesystem.usage"
  }

  calculation {
    op     = "SUM"
    column = "metrics.memory.usage"
  }

  calculation {
    op     = "SUM"
    column = "metrics.cpu.usage"
  }

  calculation {
    op     = "MIN"
    column = "metrics.uptime"
  }

  filter {
    column = "label.app.kubernetes.io/name"
    op     = "exists"
  }

  breakdowns = [
    "label.app.kubernetes.io/name"
  ]

  order {
    op     = "SUM"
    column = "metrics.filesystem.usage"
    order  = "descending"
  }
  granularity = 60
  time_range  = var.query_time_range
}

####################################################
# Implement the Query Using the Specification
####################################################
resource "honeycombio_query" "application_health" {
  dataset    = var.dataset_name
  query_json = data.honeycombio_query_specification.application_health.json
}

################################################################
# Attach an Annotation to the Query to Explain What it Does
################################################################
resource "honeycombio_query_annotation" "application_health" {
  dataset     = var.dataset_name
  description = "Shows the the collections of pods grouped by Kubernetes application label."
  name        = "Application Health"
  query_id    = honeycombio_query.application_health.id
}

####################################################
# Create Outputs for Use by Other Modules
####################################################
output "application_health_id" {
  value = honeycombio_query.application_health.id
}

output "application_health_annotation_id" {
  value = honeycombio_query_annotation.application_health.id
}
