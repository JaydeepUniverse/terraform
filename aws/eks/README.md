
## Prerequisites
- ### Install kubectl
- ### Install AWS CLI
- ### Install AWS IAM Authenticator
- ### Update kubeconfig file if needed
  - `aws eks update-kubeconfig --name eksClusterName`

## Please keep in mind about below commented notes while changing names of name,cluster,environment else EKS,ASG,VPC all resources will be created but while running `kubectl get nodes` command it won't show any worker nodes 
```terraform
provider "aws" {
  region = "us-east-2" # region
}

module "vpc" {
  source = "../../modules/vpc"
  vpc-location                        = "Ohio" # location name as per region
  namespace                           = "nextgen-cicd" # namespace
  name                                = "vpc" # KEEP IT AS IS
  stage                               = "dev" # stage name
  cluster-name                        = "nextgen-cicd-dev-eks-cluster" # cluster name = namespace-stagename-eks-cluster
}

module "eks_workers" {
  namespace                          = "nextgen-cicd" # namespace
  stage                              = "dev" # stage name
  name                               = "eks" # KEEP IT AS IS
  cluster_name                       = "nextgen-cicd-dev-eks-cluster" # cluster name = namespace-stagename-eks-cluster
  key_name                           = "nextgen-cicd-key" # MAKE SURE THIS KEY MUST BE CREATED BEFORE RUNNING THIS SCRIPT
}

module "eks_cluster" {
  namespace                    = "nextgen-cicd" # namespace
  stage                        = "dev" # stage name
  name                         = "eks" # KEEP IT AS IS
  region                       = "us-east-2" # region
}
```

## If you want custom AMI then 
- change `variable "use_custom_image_id"` to `true` in `/eks/modules/eks-cluster-workers/variables.tf`
- and then change AMI ID here in main.tf file `/aws/eks/environment/dev/main.tf`

