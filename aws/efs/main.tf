provider "aws" {
  version = "~> 2.0"
  region  = "us-east-2"
}

resource "aws_efs_file_system" "nextgencicdefs" {
    encrypted = false
    tags = {
        EmployeeID: aaa
        EmployeeName: "aaa"
    }
}

resource "aws_efs_mount_target" "nextgencicdefsmount-1" {
    file_system_id = "${aws_efs_file_system.nextgencicdefs.id}"
    subnet_id      = "subnet-aaa"
    security_groups = [
        "sg-062807f95d7938cb1"
    ]
}

resource "aws_efs_mount_target" "nextgencicdefsmount-2" {
    file_system_id = "${aws_efs_file_system.nextgencicdefs.id}"
    subnet_id      = "subnet-aaa"
    security_groups = [
        "sg-062807f95d7938cb1"
    ]
}

resource "aws_subnet" "subnet-aaa" {
    vpc_id = "vpc-aaa"
    cidr_block = "10.20.1.0/24"
    tags = {
        "Name": "nextgen-cicd-dev-public-subnets-1"
        "kubernetes.io/cluster/nextgen-cicd-dev-eks-cluster": "shared"
        "kubernetes.io/role/elb": "1"
    }
}

resource "aws_subnet" "subnet-aaa" {
    vpc_id = "vpc-aaa"
    cidr_block = "10.20.2.0/24"
    tags = {
        "Name": "nextgen-cicd-dev-public-subnets-2"
        "kubernetes.io/cluster/nextgen-cicd-dev-eks-cluster": "shared"
        "kubernetes.io/role/elb": "1"
    }
}
