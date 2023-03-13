variable "query_time_range" {
  description = "Query Default Time Range (in seconds). Defaults to 28800 (8 hours)"
  type        = number
  default     = 28800
}

variable "dataset_name" {
  description = "The name of the dataset used to ensure that all required columns exist in an environment for queries to be implemented"
  type        = string
  default     = "kubernetes-metrics"
}
