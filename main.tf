locals {
  rules_merged = merge(var.rule_overrides, local.rules_default)
}

resource "aws_cloudwatch_log_metric_filter" "this" {
  for_each = local.rules_merged

  name           = each.key
  log_group_name = var.log_group_name
  pattern        = each.value.pattern

  metric_transformation {
    name      = each.key
    namespace = var.alarm_namespace
    value     = "1"
  }
}

resource "aws_cloudwatch_metric_alarm" "this" {
  for_each = local.rules_merged

  alarm_name = each.key

  comparison_operator       = "GreaterThanOrEqualToThreshold"
  evaluation_periods        = "1"
  metric_name               = aws_cloudwatch_log_metric_filter.this[each.key].id
  namespace                 = var.alarm_namespace
  period                    = try(each.value.period, 300)
  statistic                 = "Sum"
  threshold                 = "1"
  alarm_description         = each.value.description
  alarm_actions             = var.alarm_action_arns
  treat_missing_data        = "notBreaching"
  insufficient_data_actions = []
}

output "alarm_arns" {
  value = values(aws_cloudwatch_metric_alarm.this)[*].arn
}
