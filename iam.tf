resource "aws_iam_role" "iam_role_for_lambda" {
  name               = "iam_role_for_lambda"
  assume_role_policy = <<EOF
{
    "Version": "2012-10-17",
    "Statement": [
       {
         "Action": "sts:AssumeRole",
         "Principal": {
           "Service": "lambda.amazonaws.com"
         },
         "Effect": "Allow",
         "Sid": ""
       }
    ]
}
EOF
  
}

resource "aws_iam_policy" "iam_policy_for_lambda" {
  name   = "iam_policy_for_lambda"
  policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Sid": "Stmt1648319000945",
      "Action": "cloudwatch:*",
      "Effect": "Allow",
      "Resource": "*"
    }
  ]
}
EOF
}

resource "aws_iam_role_policy_attachment" "logs" {
  role       = aws_iam_role.iam_role_for_lambda.name
  policy_arn = aws_iam_policy.iam_policy_for_lambda.arn
}
