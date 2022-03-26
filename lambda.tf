locals {
  lambda_code_location = "outputs/testmodule.zip"
}
data "archive_file" "zip_the_python_code" {
  type        = "zip"
  source_file = "${path.module}/testmodule.py"
  output_path = local.lambda_code_location
}

resource "aws_lambda_function" "lambda_funct" {
  filename         = local.lambda_code_location
  function_name    = var.function_name
  role             = aws_iam_role.iam_role_for_lambda.arn
  handler          = var.handler
  runtime          = var.runtime
  depends_on       = [aws_iam_role_policy_attachment.logs]
  source_code_hash = filebase64sha256("${path.module}/testmodule.py")
}
