output "alarm_arns" {
  value = values(aws_cloudwatch_metric_alarm.this)[*].arn
}
