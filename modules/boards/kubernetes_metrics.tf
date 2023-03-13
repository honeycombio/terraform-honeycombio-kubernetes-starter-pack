resource "honeycombio_board" "kubernetes_metrics" {
  column_layout = "multi"
  description   = "A Board With Queries Against the Kubernetes Metrics Dataset"
  name          = "Kubernetes Metrics"
  style         = "visual"

  query {

    graph_settings {
      hide_markers        = "false"
      log_scale           = "false"
      omit_missing_values = "false"
      stacked_graphs      = "false"
      utc_xaxis           = "false"
    }

    query_id            = var.node_utilization_id
    query_annotation_id = var.node_utilization_annotation_id
    query_style         = "graph"
  }

  query {

    graph_settings {
      hide_markers        = "false"
      log_scale           = "false"
      omit_missing_values = "false"
      stacked_graphs      = "false"
      utc_xaxis           = "false"
    }

    query_id            = var.pod_cpu_utilization_id
    query_annotation_id = var.pod_cpu_utilization_annotation_id
    query_style         = "graph"
  }

  query {

    graph_settings {
      hide_markers        = "false"
      log_scale           = "false"
      omit_missing_values = "false"
      stacked_graphs      = "false"
      utc_xaxis           = "false"
    }

    query_id            = var.cluster_size_id
    query_annotation_id = var.cluster_size_annotation_id
    query_style         = "graph"
  }

  query {

    graph_settings {
      hide_markers        = "false"
      log_scale           = "false"
      omit_missing_values = "false"
      stacked_graphs      = "false"
      utc_xaxis           = "false"
    }

    query_id            = var.pods_not_running_id
    query_annotation_id = var.pods_not_running_annotation_id
    query_style         = "graph"
  }

  query {

    graph_settings {
      hide_markers        = "false"
      log_scale           = "false"
      omit_missing_values = "false"
      stacked_graphs      = "false"
      utc_xaxis           = "false"
    }

    query_id            = var.node_fs_utilization_id
    query_annotation_id = var.node_fs_utilization_annotation_id
    query_style         = "graph"
  }

  query {

    graph_settings {
      hide_markers        = "false"
      log_scale           = "false"
      omit_missing_values = "true"
      stacked_graphs      = "false"
      utc_xaxis           = "false"
    }

    query_id            = var.application_health_id
    query_annotation_id = var.application_health_annotation_id
    query_style         = "graph"
  }

  query {

    graph_settings {
      hide_markers        = "false"
      log_scale           = "false"
      omit_missing_values = "true"
      stacked_graphs      = "false"
      utc_xaxis           = "false"
    }

    query_id            = var.network_health_id
    query_annotation_id = var.network_health_annotation_id
    query_style         = "graph"
  }

}
