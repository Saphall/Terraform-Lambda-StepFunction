provider "aws" {
  region = var.region
}

provider "archive" {}
data "archive_file" "zip_lambda_one" {
  type        = "zip"
  source_file = "${path.module}/Lambda_one/main.py"
  output_path = "lambda_one.zip"
}

data "archive_file" "zip_lambda_two" {
  type        = "zip"
  source_file = "${path.module}/Lambda_two/main.py"
  output_path = "lambda_two.zip"
}


data "aws_iam_policy_document" "policy" {
  statement {
    sid    = ""
    effect = "Allow"
    principals {
      identifiers = ["lambda.amazonaws.com"]
      type        = "Service"
    }
    actions = ["sts:AssumeRole"]
  }
}

resource "aws_iam_role" "iam_for_lambda" {
  name               = "iam_for_lambda"
  assume_role_policy = data.aws_iam_policy_document.policy.json
}

resource "aws_lambda_function" "lambda_one" {
  function_name    = "lambda_one"
  filename         = data.archive_file.zip_lambda_one.output_path
  source_code_hash = data.archive_file.zip_lambda_one.output_base64sha256
  role             = aws_iam_role.iam_for_lambda.arn
  handler          = "main.handler"
  runtime          = "python3.8"
}

resource "aws_lambda_function" "lambda_two" {
  function_name    = "lambda_two"
  filename         = data.archive_file.zip_lambda_two.output_path
  source_code_hash = data.archive_file.zip_lambda_two.output_base64sha256
  role             = aws_iam_role.iam_for_lambda.arn
  handler          = "main.handler"
  runtime          = "python3.8"
}
