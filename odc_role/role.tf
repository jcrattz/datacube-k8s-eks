data "aws_caller_identity" "current" {
}

resource "aws_iam_role" "role" {
  name  = var.role.name

  assume_role_policy = <<-EOF
  {
    "Version": "2012-10-17",
    "Statement": [
      {
        "Sid": "",
        "Effect": "Allow",
        "Principal": {
          "Service": "ec2.amazonaws.com"
        },
        "Action": "sts:AssumeRole"
      },
      {
        "Sid": "",
        "Effect": "Allow",
        "Principal": {
          "AWS": "arn:aws:iam::${data.aws_caller_identity.current.account_id}:role/nodes.${var.cluster_id}"
        },
        "Action": "sts:AssumeRole"
      }
    ]
  }
  EOF

  tags = merge(
    {
      Name = var.role.name
      owner = var.owner
      namespace = var.namespace
      environment = var.environment
    },
    var.tags
  )
}

resource "aws_iam_role_policy" "role_policy" {
  name  = var.role.name
  role  = aws_iam_role.role.id
  policy = var.role.policy
}
