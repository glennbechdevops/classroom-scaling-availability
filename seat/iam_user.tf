resource "aws_iam_user" "student" {
  name          = var.student_id
  force_destroy = true
}
resource "aws_iam_user_login_profile" "user_login" {
  user                    = aws_iam_user.student.name
  pgp_key                 = filebase64("classroom_key.pub")
  password_reset_required = false
  password_length         = 8
}

resource "aws_iam_user_policy" "student_policy" {
  name = "test"
  user = aws_iam_user.student.name

  policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": [
        "ssm:*",
        "ecs:*",
        "cloud9:*",
        "sns:*",
        "ecs:*",
        "lambda:*",
        "api:*",
        "apigateway:*",
        "execute-api:*",
        "ecr:*",
        "sns:*",
        "servicequotas:*",
        "apprunner:*",
        "cloudwatch:*",
        "logs:*",
        "elasticloadbalancing:*",
        "applicationinsights:*",
        "resource-groups:*",
        "iam:*",
        "comprehend:*",
        "codedeploy:*",
        "cloudformation:*",
        "s3:*",
        "ec2:*"
      ],
      "Effect": "Allow",
      "Resource": "*"
    }
  ]
}
EOF
}