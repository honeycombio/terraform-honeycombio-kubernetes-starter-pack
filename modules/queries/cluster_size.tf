####################################################
# Define the Query Specification
####################################################
data "honeycombio_query_specification" "cluster_size" {
  calculation {
    op     = "COUNT_DISTINCT"
    column = "k8s.node.name"
  }
  filter {
    column = "k8s.node.name"
    op     = "exists"
  }
  filter {
    column = "k8s.pod.name"
    op     = "does-not-exist"
  }
  time_range = var.query_time_range
}


####################################################
# Implement the Query Using the Specification
####################################################
resource "honeycombio_query" "cluster_size" {
  dataset    = var.dataset_name
  query_json = data.honeycombio_query_specification.cluster_size.json
}

################################################################
# Attach an Annotation to the Query to Explain What it Does
################################################################
resource "honeycombio_query_annotation" "cluster_size" {
  dataset     = var.dataset_name
  description = "Shows the number of nodes in the cluster."
  name        = "Cluster Size"
  query_id    = honeycombio_query.cluster_size.id
}

####################################################
# Create Outputs for Use by Other Modules
####################################################
output "cluster_size_id" {
  value = honeycombio_query.cluster_size.id
}

output "cluster_size_annotation_id" {
  value = honeycombio_query_annotation.cluster_size.id
}
