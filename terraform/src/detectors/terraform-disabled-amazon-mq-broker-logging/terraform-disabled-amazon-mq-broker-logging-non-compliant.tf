# Copyright Amazon.com, Inc. or its affiliates. All Rights Reserved.
# SPDX-License-Identifier: MIT-0

# {fact rule=terraform-disabled-amazon-mq-broker-logging@v1.0 defects=1}
resource "aws_mq_broker" "disabled" {
  broker_name        = "example"
  engine_type        = "ActiveMQ"
  engine_version     = "5.16.3"
  host_instance_type = "mq.t3.micro"

  user {
    password = "admin123"
    username = "admin"
  }

  logs {
    # Noncompliant: Logging is not enabled for the Amazon MQ Broker.
    general = false
    audit   = true
  }

  encryption_options {
    use_aws_owned_key = false
    kms_key_id        = aws_kms_key.example.arn
  }
  security_groups = []
  auto_minor_version_upgrade = true
}
# {/fact}
