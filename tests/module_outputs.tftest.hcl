mock_provider "aws" {}

run "module" {
  module {
    source = "./examples/simple"
  }

  assert {
    condition     = length(module.cis_alarms.alarm_arns) == 14
    error_message = "there sould be 14 alarms"
  }

  assert {
    condition     = module.cis_alarms.alarm_arns[0] == "wyJROOO"
    error_message = "there should be an ARN in the output"
  }
}
