# Terraform AWS CloudTrail CIS Alerts

This module contains alert definitions to comply with the [CIS AWS Foundation Benchmark]([CIS AWS Foundations Benchmark - AWS Security Hub](https://docs.aws.amazon.com/securityhub/latest/userguide/cis-aws-foundations-benchmark.html).

## Usage

### Examples

```hcl
module "cis_alarms" {
  source = "makandra/aws-cloudtrail-cis-alarms"

  alarm_action_arns = module.sns_topic.topic_arn
  log_group_name = "cloud-trail-logs"
}
```

Further examples can be found in the `examples` directory.

### Overriding Rules

You can add additional rules or overwrite existing rules by passing a map of rules via `rule_overrides` parameter. There is no deep merge. When adding an object with a key that exist in `rules.tf`, the whole rule is reset with the parameters set in `rule_overrides`.

```hcl
module "cis_alarms" {
  source = "../../"

  rule_overrides = {
    FancyRule = {
      pattern     = "{$.errorCode = \"Fancy\"}"
      description = "My fancy rule"
      period      = 300
    }
  }
}
```

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.5.0 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | ~> 5.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | ~> 5.0 |

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
