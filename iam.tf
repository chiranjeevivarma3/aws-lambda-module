resource "aws_iam_role" "iam_role_for_lambda" {
  name               = "iam_role_for_lambda"
  assume_role_policy = file("iam/iam-role-lambda.json")
}

resource "aws_iam_policy" "iam_policy_for_lambda" {
  name   = "iam_policy_for_lambda"
  policy = file("iam/iam-policy-lambda.json")
}

resource "aws_iam_role_policy_attachment" "logs" {
  role       = aws_iam_role.iam_role_for_lambda.name
  policy_arn = aws_iam_policy.iam_policy_for_lambda.arn
}
