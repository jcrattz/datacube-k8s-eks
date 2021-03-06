variable "namespace" {
  type = string
  description = "The unique namespace for the environment, which could be your organization name or abbreviation"
  default = "odc-test"
}

variable "owner" {
  type = string
  description = "The owner of the environment"
  default = "odc-test"
}

variable "environment" {
  type = string
  description = "The name of the environment - e.g. dev, stage, prod"
  default = "stage"
}

variable "tags" {
  type        = map(string)
  description = "Additional tags (e.g. `map('StackName','XYZ')`)"
  default     = {}
}

variable "user" {
  type        = map
  description = "Provision a user that can be used by pods/applications on the k8s cluster"
}