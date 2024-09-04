module "cis_alarms" {
  source = "../../"

  alarm_action_arns = ["arn:aws:sns:us-east-2:123456789012:MyTopic"]
  log_group_name    = "cloud-trail-logs"
}
