
locals {
  rules_default = {
    UnauthorizedApiCalls = {
      pattern     = "{ ($.errorCode = \"*UnauthorizedOperation\") || ($.errorCode = \"AccessDenied*\") }"
      description = "# CIS AWS Foundations Benchmark v1.4.0/4.1\nUnauthorized API calls\n[Security Hub controls for CloudWatch - AWS Security Hub](https://docs.aws.amazon.com/securityhub/latest/userguide/cloudwatch-controls.html#cloudwatch-2)"
    }

    NoMFAConsoleSignin = {
      pattern     = "{ ($.eventName = \"ConsoleLogin\") && ($.additionalEventData.MFAUsed != \"Yes\") }"
      period      = 300
      description = "# CIS AWS Foundations Benchmark v1.2.0/3.2\nsingle-factor console logins\n[Security Hub controls for CloudWatch - AWS Security Hub](https://docs.aws.amazon.com/securityhub/latest/userguide/cloudwatch-controls.html#cloudwatch-3)"
    }

    RootUsage = {
      pattern     = "{ $.userIdentity.type = \"Root\" && $.userIdentity.invokedBy NOT EXISTS && $.eventType != \"AwsServiceEvent\" }"
      description = "# CIS AWS Foundations Benchmark v1.4.0/4.3\n"
    }

    IamChanges = {
      pattern     = "{($.eventName=DeleteGroupPolicy)||($.eventName=DeleteRolePolicy)||($.eventName=DeleteUserPolicy)||($.eventName=PutGroupPolicy)||($.eventName=PutRolePolicy)||($.eventName=PutUserPolicy)||($.eventName=CreatePolicy)||($.eventName=DeletePolicy)||($.eventName=CreatePolicyVersion)||($.eventName=DeletePolicyVersion)||($.eventName=AttachRolePolicy)||($.eventName=DetachRolePolicy)||($.eventName=AttachUserPolicy)||($.eventName=DetachUserPolicy)||($.eventName=AttachGroupPolicy)||($.eventName=DetachGroupPolicy)}"
      description = "# CIS AWS Foundations Benchmark v1.4.0/4.4\nChanges to IAM\n[Security Hub controls for CloudWatch - AWS Security Hub](https://docs.aws.amazon.com/securityhub/latest/userguide/cloudwatch-controls.html#cloudwatch-4)"
    }

    CloudTrailConfigChanges = {
      pattern     = "{ ($.eventName = CreateTrail) || ($.eventName = UpdateTrail) || ($.eventName = DeleteTrail) || ($.eventName = StartLogging) || ($.eventName = StopLogging) }"
      description = "# CIS AWS Foundations Benchmark v1.4.0/4.3\nChanges to CloudTrail\n[Security Hub controls for CloudWatch - AWS Security Hub](https://docs.aws.amazon.com/securityhub/latest/userguide/cloudwatch-controls.html#cloudwatch-5)"
    }

    ConsoleSigninFailures = {
      pattern     = "{ ($.eventName = ConsoleLogin) && ($.errorMessage = \"Failed authentication\") }"
      description = "# CIS AWS Foundations Benchmark v1.4.0/4.5\nFailed console logins\n[Security Hub controls for CloudWatch - AWS Security Hub](https://docs.aws.amazon.com/securityhub/latest/userguide/cloudwatch-controls.html#cloudwatch-6)"
    }

    DisableOrDeleteCMK = {
      pattern     = "{ ($.eventSource = kms.amazonaws.com) && (($.eventName = DisableKey) || ($.eventName = ScheduleKeyDeletion)) }"
      description = "# CIS AWS Foundations Benchmark v1.4.0/4.7\nFailed console logins\n[Security Hub controls for CloudWatch - AWS Security Hub](https://docs.aws.amazon.com/securityhub/latest/userguide/cloudwatch-controls.html#cloudwatch-7)"
    }

    S3BucketPolicyChanges = {
      pattern     = "{ ($.eventSource = s3.amazonaws.com) && (($.eventName = PutBucketAcl) || ($.eventName = PutBucketPolicy) || ($.eventName = PutBucketCors) || ($.eventName = PutBucketLifecycle) || ($.eventName = PutBucketReplication) || ($.eventName = DeleteBucketPolicy) || ($.eventName = DeleteBucketCors) || ($.eventName = DeleteBucketLifecycle) || ($.eventName = DeleteBucketReplication)) }"
      description = "# CIS AWS Foundations Benchmark v1.4.0/4.8\nS3 Bucket policy changes\n[Security Hub controls for CloudWatch - AWS Security Hub](https://docs.aws.amazon.com/securityhub/latest/userguide/cloudwatch-controls.html#cloudwatch-8)"

    }

    AWSConfigChanges = {
      pattern     = "{ ($.eventSource = config.amazonaws.com) && (($.eventName=StopConfigurationRecorder)||($.eventName=DeleteDeliveryChannel)||($.eventName=PutDeliveryChannel)||($.eventName=PutConfigurationRecorder)) }"
      description = "# CIS AWS Foundations Benchmark v1.4.0/4.9\nAWS Config configuration changes\n[Security Hub controls for CloudWatch - AWS Security Hub](https://docs.aws.amazon.com/securityhub/latest/userguide/cloudwatch-controls.html#cloudwatch-9)"

    }

    SecurityGroupChanges = {
      pattern     = "{($.eventName=AuthorizeSecurityGroupIngress) || ($.eventName=AuthorizeSecurityGroupEgress) || ($.eventName=RevokeSecurityGroupIngress) || ($.eventName=RevokeSecurityGroupEgress) || ($.eventName=CreateSecurityGroup) || ($.eventName=DeleteSecurityGroup)}"
      description = "# CIS AWS Foundations Benchmark v1.4.0/4.10\nChanges to Security Groups\n[Security Hub controls for CloudWatch - AWS Security Hub](https://docs.aws.amazon.com/securityhub/latest/userguide/cloudwatch-controls.html#cloudwatch-10)"
    }

    NACLChanges = {
      pattern     = "{ ($.eventName = CreateNetworkAcl) || ($.eventName = CreateNetworkAclEntry) || ($.eventName = DeleteNetworkAcl) || ($.eventName = DeleteNetworkAclEntry) || ($.eventName = ReplaceNetworkAclEntry) || ($.eventName = ReplaceNetworkAclAssociation) }"
      description = "# CIS AWS Foundations Benchmark v1.4.0/4.11\nChanges to Network Access Lists\n[Security Hub controls for CloudWatch - AWS Security Hub](https://docs.aws.amazon.com/securityhub/latest/userguide/cloudwatch-controls.html#cloudwatch-11)"
    }

    NetworkGWChanges = {
      pattern     = "{ ($.eventName = CreateCustomerGateway) || ($.eventName = DeleteCustomerGateway) || ($.eventName = AttachInternetGateway) || ($.eventName = CreateInternetGateway) || ($.eventName = DeleteInternetGateway) || ($.eventName = DetachInternetGateway) }"
      description = "# CIS AWS Foundations Benchmark v1.4.0/4.12\nChanges to Network Gateways.\n[Security Hub controls for CloudWatch - AWS Security Hub](https://docs.aws.amazon.com/securityhub/latest/userguide/cloudwatch-controls.html#cloudwatch-12)"
    }

    RouteTableChanges = {
      pattern     = "{ ($.eventName = CreateRoute) || ($.eventName = CreateRouteTable) || ($.eventName = ReplaceRoute) || ($.eventName = ReplaceRouteTableAssociation) || ($.eventName = DeleteRouteTable) || ($.eventName = DeleteRoute) || ($.eventName = DisassociateRouteTable) }"
      description = "# CIS AWS Foundations Benchmark v1.4.0/4.13\nChanges to Route Tables.\n[Security Hub controls for CloudWatch - AWS Security Hub](https://docs.aws.amazon.com/securityhub/latest/userguide/cloudwatch-controls.html#cloudwatch-13)"
    }

    VpcChanges = {
      pattern     = "{ ($.eventName = CreateVpc) || ($.eventName = DeleteVpc) || ($.eventName = ModifyVpcAttribute) || ($.eventName = AcceptVpcPeeringConnection) || ($.eventName = CreateVpcPeeringConnection) || ($.eventName = DeleteVpcPeeringConnection) || ($.eventName = RejectVpcPeeringConnection) || ($.eventName = AttachClassicLinkVpc) || ($.eventName = DetachClassicLinkVpc) || ($.eventName = DisableVpcClassicLink) || ($.eventName = EnableVpcClassicLink) }"
      description = "# CIS AWS Foundations Benchmark v1.4.0/4.14 Changes to VPC's \n [Security Hub controls for CloudWatch - AWS Security Hub](https://docs.aws.amazon.com/securityhub/latest/userguide/cloudwatch-controls.html#cloudwatch-14)"
    }
  }
}
