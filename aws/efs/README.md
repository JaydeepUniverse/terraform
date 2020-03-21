#### Along with EFS creation we'd need to mount on subnet as well where we would going to use it, hence To get existing subnet details follow below steps
- Import existing subnet details by adding below code to main.tf and 
-   ```terraform
    resource "aws_subnet" "subnet-aaa" {
    }

    resource "aws_subnet" "subnet-aaa" {
    }
    ```
- Run `terraform import` command as below
    `terraform import aws_subnet.subnet-aaa subnet-aaa`
    `terraform import aws_subnet.subnet-aaa subnet-aaa`
- Then add subnet values from terraform.tfstateto main.tf else terraform will add/remove parameters accordingly for the same subnet ex.
    ```terraform
    resource "aws_subnet" "subnet-aaa" {
    vpc_id = "vpc-aaa"
    cidr_block = "10.20.1.0/24"
    tags = {
        "Name": "nextgen-cicd-dev-public-subnets-1"
        "kubernetes.io/cluster/nextgen-cicd-dev-eks-cluster": "shared"
        "kubernetes.io/role/elb": "1"
      }
    }
    ```