variable "rule_overrides" {
  description = "override rule settings"
  type = map(object({
    pattern     = string
    description = string
  }))

  default = {}

}

variable "log_group_name" {
  type        = string
  description = "The log group name where the CloudTrail logs are stored"
}

variable "alarm_namespace" {
  description = "Namespace where the alarms belong to"
  type        = string
  default     = "CIS-Benchmark"
}

variable "alarm_action_arns" {
  description = "list of arns for alarm actions"
  type        = list(any)
}
