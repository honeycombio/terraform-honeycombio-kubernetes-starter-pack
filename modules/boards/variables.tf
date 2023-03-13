variable "dataset_name" {
  description = "The name of the dataset to use for the board"
  type        = string
}

//node_filesystem_utilization
variable "node_fs_utilization_id" {
  description = "The ID of the query to use for the board"
  type        = string
}

variable "node_fs_utilization_annotation_id" {
  description = "The ID of the query annotation to use for the board"
  type        = string
}

//network_health
variable "network_health_id" {
  description = "The ID of the query to use for the board"
  type        = string
}

variable "network_health_annotation_id" {
  description = "The ID of the query annotation to use for the board"
  type        = string
}

//cluster_size
variable "cluster_size_id" {
  description = "The ID of the query to use for the board"
  type        = string
}

variable "cluster_size_annotation_id" {
  description = "The ID of the query annotation to use for the board"
  type        = string
}

//node_cpu_utilization
variable "node_utilization_id" {
  description = "The ID of the query to use for the board"
  type        = string
}

variable "node_utilization_annotation_id" {
  description = "The ID of the query annotation to use for the board"
  type        = string
}

//pod_cpu_utilization
variable "pod_cpu_utilization_id" {
  description = "The ID of the query to use for the board"
  type        = string
}

variable "pod_cpu_utilization_annotation_id" {
  description = "The ID of the query annotation to use for the board"
  type        = string
}

//pods_not_running
variable "pods_not_running_id" {
  description = "The ID of the query to use for the board"
  type        = string
}

variable "pods_not_running_annotation_id" {
  description = "The ID of the query annotation to use for the board"
  type        = string
}

//application_health
variable "application_health_id" {
  description = "The ID of the query to use for the board"
  type        = string
}

variable "application_health_annotation_id" {
  description = "The ID of the query annotation to use for the board"
  type        = string
}
