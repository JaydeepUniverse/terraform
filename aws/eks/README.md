```html
<div dir="ltr" style="text-align: left;" trbidi="on">
    <html>
    <meta name="viewport"content="width=device-width, initial-scale=1">
    <link rel="stylesheet"href="https://www.w3schools.com/w3css/4/w3.css">
    <link rel="stylesheet"href="https://www.w3schools.com/lib/w3-colors-flat.css">
    <style>
        pre code {
                background-color: #eee;
                display: block;
                padding: 20px;
                color: black;
                overflow-x: auto;
                white-space: pre-wrap;
                white-space: -moz-pre-wrap;
                white-space: -pre-wrap;
                white-space: -o-pre-wrap;
                word-wrap: break-word;
                line-height: 20px;
            }
        code {color: blue;}
    </style>
    <body>
        <div class="w3-panel w3-flat-turquoise">
            <h4>Full script is available at</h4> 
            <p><a href="https://github.com/JaydeepUniverse/terraform/tree/master/aws/eks" target="_blank"><u>https://github.com/JaydeepUniverse/terraform/tree/master/aws/eks</u></a></p>
            <h4>Prerequisites</h4> 
            <ul>
                <li>Install kubectl</li>
                <li>Install AWS CLI</li>
                <li>Install AWS IAM Authenticator</li>
                <li>Update kubeconfig file if needed</li>
                <ul>
                    <li><code>aws eks update-kubeconfig --name eksClusterName</code></li>
                </ul>
            </ul>
            <h4>Please keep in mind about below commented notes while changing names of name,cluster,environment else EKS,ASG,VPC all resources will be created but while running <code>kubectl get nodes</code> command it won't show any worker nodes</h4>
            <pre>
                <code>
provider "aws" {
    region = "us-east-2" <span style="color:red;"># region</span>
  }
  
module "vpc" {
    source        = "../../modules/vpc"
    vpc-location  = "Ohio" <span style="color:red;"># location name as per region</span>
    namespace     = "nextgen-cicd" <span style="color:red;"># namespace</span>
    name          = "vpc" <span style="color:red;"># KEEP IT AS IS</span>
    stage         = "dev" <span style="color:red;"># stage name</span>
    cluster-name  = "nextgen-cicd-dev-eks-cluster" <span style="color:red;"># clustername = namespace-stagename-eks-cluster</span>
}
  
module "eks_workers" {
    namespace    = "nextgen-cicd" <span style="color:red;"># namespace</span>
    stage        = "dev" <span style="color:red;"># stage name</span>
    name         = "eks" <span style="color:red;"># KEEP IT AS IS</span>
    cluster_name = "nextgen-cicd-dev-eks-cluster" <span style="color:red;"># clustername = namespace-stagename-eks-cluster</span>
    key_name     = "nextgen-cicd-key" <span style="color:red;"># MAKE SURE THIS KEY MUST BE CREATED BEFORE RUNNING THIS SCRIPT</span>
}
  
module "eks_cluster" {
    namespace  = "nextgen-cicd" <span style="color:red;"># namespace</span>
    stage      = "dev" <span style="color:red;"># stage name</span>
    name       = "eks" <span style="color:red;"># KEEP IT AS IS</span>
    region     = "us-east-2" <span style="color:red;"># region</span>
}
                </code>
            </pre>
        </div>
    </body>
    </html>
</div>
```