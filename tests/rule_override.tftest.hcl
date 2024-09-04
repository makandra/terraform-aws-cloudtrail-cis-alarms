mock_provider "aws" {}

run "rule_override" {
  variables {
    alarm_action_arns = ["arn:aws:sns:us-east-2:123456789012:MyTopic"]
    log_group_name    = "cloud-trail-logs"

    rule_overrides = {
      FancyRule = {
        pattern ="{$.errorCode = \"Fancy\"}"
        description = "My fancy rule"
      }
    }
  }

  assert {
    condition     =  local.rules_merged["FancyRule"].description == "My fancy rule"
    error_message = "FancyRule should be merged and have description 'My fancy rule'"
  }
  assert {
    condition     =  local.rules_merged["NoMFAConsoleSignin"].period == 300
    error_message = "NoMFAConsoleSignin should have period of 300"
  }
}
