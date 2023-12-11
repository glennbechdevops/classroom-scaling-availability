output "cloud9_url" {
  value = "https://${var.region}.console.aws.amazon.com/cloud9/ide/${aws_cloud9_environment_ec2.cloud_9_env.id}"
}

output "password" {
  value = aws_iam_user_login_profile.user_login.encrypted_password
}