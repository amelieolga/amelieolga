# Install aws IAM authenticator download before you can interact with your cluser
# use this link https://docs.aws.amazon.com/eks/latest/userguide/install-aws-iam-authenticator.html
# curl -o aws-iam-authenticator.sha256 https://amazon-eks.s3.us-west-2.amazonaws.
# com/1.21.2/2021-07-05/bin/linux/amd64/aws-iam-authenticator.sha256
# chmod +x ./aws-iam-authenticator
# mkdir -p $HOME/bin && cp ./aws-iam-authenticator $HOME/bin/aws-iam-authenticator && export PATH=$PATH:$HOME/bin
# echo 'export PATH=$PATH:$HOME/bin' >> ~/.bashrc
# aws-iam-authenticator help
# EKS Cluster Resources
#  * IAM Role to allow EKS service to manage other AWS services
#  * EC2 Security Group to allow networking traffic with EKS cluster
#  * EKS Cluster
#

resource "aws_iam_role" "altana-cluster" {
  name = "terraform-eks-altana-cluster"

  assume_role_policy = <<POLICY
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Principal": {
        "Service": "eks.amazonaws.com"
      },
      "Action": "sts:AssumeRole"
    }
  ]
}
POLICY
}

resource "aws_iam_role_policy_attachment" "altana-cluster-AmazonEKSClusterPolicy" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSClusterPolicy"
  role       = aws_iam_role.altana-cluster.name
}

resource "aws_iam_role_policy_attachment" "altana-cluster-AmazonEKSVPCResourceController" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSVPCResourceController"
  role       = aws_iam_role.altana-cluster.name
}

resource "aws_security_group" "altana-cluster" {
  name        = "terraform-eks-altana-cluster"
  description = "Cluster communication with worker nodes"
  vpc_id = aws_vpc.altana-vpc.id

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "terraform-eks-altana"
  }
}

resource "aws_security_group_rule" "altana-cluster-ingress-workstation-https" {
  cidr_blocks       = [local.workstation-external-cidr]
  description       = "Allow workstation to communicate with the cluster API Server"
  from_port         = 443
  protocol          = "tcp"
  security_group_id = aws_security_group.altana-cluster.id
  to_port           = 443
  type              = "ingress"
}

resource "aws_eks_cluster" "altana" {
  name     = var.cluster-name
  role_arn = aws_iam_role.altana-cluster.arn

  vpc_config {
    security_group_ids = [aws_security_group.altana-cluster.id]
    subnet_ids         = aws_subnet.altana[*].id
  }

  depends_on = [
    aws_iam_role_policy_attachment.altana-cluster-AmazonEKSClusterPolicy,
    aws_iam_role_policy_attachment.altana-cluster-AmazonEKSVPCResourceController,
  ]
}