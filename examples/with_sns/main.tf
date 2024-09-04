
module "sns_topic" {
  source  = "terraform-aws-modules/sns/aws"
  version = "6.1.0"

  name = "cloud-trail-alarms"
}
module "cis_alarms" {
  source = "../../"

  alarm_action_arns = [module.sns_topic.topic_arn]
  log_group_name    = "cloud-trail-logs"
}
