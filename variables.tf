# Input variable definitions

variable "create_dataset" {
  description = "Whether to create a new dataset or use an existing one"
  type        = bool
  default     = false
}

variable "create_columns" {
  description = "Whether to create columns used by the board queries"
  type        = bool
  default     = false
}

variable "dataset_name" {
  description = "The name of the dataset to use for derived columns and queries"
  type        = string
  default     = "kubernetes-metrics"
}

variable "query_time_range" {
  description = "Query Default Time Range (in seconds). Defaults to 28800 (8 hours)"
  type        = number
  default     = 28800
}
