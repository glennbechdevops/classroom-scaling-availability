resource "aws_ecr_repository" "private_repo" {
  name = "${aws_iam_user.student.name}-private"
}