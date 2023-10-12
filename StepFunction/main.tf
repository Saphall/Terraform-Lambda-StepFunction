provider "aws" {
  region = var.region
}


data "aws_caller_identity" "current" {}

locals {
  account_id = data.aws_caller_identity.current.account_id
}


/**
 * Step-function role policy.
 */
data "aws_iam_policy_document" "step_function_role_policy" {
  version = "2012-10-17"
  statement {
    effect = "Allow"
    actions = [
      "sts:AssumeRole"
    ]
    principals {
      type        = "Service"
      identifiers = ["states.amazonaws.com"]
    }
    sid = "StepFunctionAssumeRole"
  }
}

/**
 * Step-function permission policy.
 */
data "aws_iam_policy_document" "step_function_policy_document" {
  version = "2012-10-17"
  statement {
    effect = "Allow"
    actions = [
      "lambda:InvokeFunction",
      "lambda:InvokeAsync"
    ]

    # tfsec:ignore:aws-iam-no-policy-wildcards
    resources = ["*"]
  }
}

resource "aws_iam_role" "step_function_role" {
  name               = "${var.step_function_name}-role"
  assume_role_policy = data.aws_iam_policy_document.step_function_role_policy.json
}

resource "aws_iam_role_policy" "step_function_policy" {
  name = "${var.step_function_name}-policy"
  role = aws_iam_role.step_function_role.id

  policy = data.aws_iam_policy_document.step_function_policy_document.json
}

resource "aws_sfn_state_machine" "sfn_state_machine" {
  name     = var.step_function_name
  role_arn = aws_iam_role.step_function_role.arn
  definition = templatefile("${path.module}/state_machine_definition.json", {
    aws_region     = var.region,
    aws_account_id = local.account_id
  })
}