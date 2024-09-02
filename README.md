# Terraform AWS CloudTrail CIS Alerts

<!-- BEGIN_TF_DOCS -->
## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | 5.65.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_cloudwatch_log_metric_filter.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cloudwatch_log_metric_filter) | resource |
| [aws_cloudwatch_metric_alarm.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cloudwatch_metric_alarm) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_alarm_action_arns"></a> [alarm\_action\_arns](#input\_alarm\_action\_arns) | list of arns for alarm actions | `list(any)` | n/a | yes |
| <a name="input_alarm_namespace"></a> [alarm\_namespace](#input\_alarm\_namespace) | Namespace where the alarms belong to | `string` | `"CIS-Benchmark"` | no |
| <a name="input_log_group_name"></a> [log\_group\_name](#input\_log\_group\_name) | The log group name where the CloudTrail logs are stored | `string` | n/a | yes |
| <a name="input_rule_overrides"></a> [rule\_overrides](#input\_rule\_overrides) | override rule settings | <pre>map(object({<br>    pattern     = string<br>    description = string<br>  }))</pre> | `{}` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_alarm_arns"></a> [alarm\_arns](#output\_alarm\_arns) | n/a |
<!-- END_TF_DOCS -->
