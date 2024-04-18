### AWS LOAD CONTROLLER CONFIG

## Step:1 Create the IAM policy with desired permission for the resources in AWS
command to create the IAM policy in aws 
```bash
aws iam create-policy \
    --policy-name < Name of the policy AWSLoadBalancerControllerIAMPolicy> \
    --policy-document file://IAMpolicy.json
```bash

## Step:2 Used the eks utility create the iamservice account and map the above policy with them

```bash
eksctl create iamserviceaccount \
  --cluster=<name of the eks cluster> \
  --namespace=kube-system \
  --name=aws-load-balancer-controller \
  --role-name "<name of the role AmazonEKSLoadBalancerControllerRole>" \
  --attach-policy-arn=arn:aws:iam::account-id:policy/AWSLoadBalancerControllerIAMPolicy \
  --approve
```bash

##  Step3: Install the helm and install the eks/aws-load-balancer-controller repo

```bash
helm repo add eks https://aws.github.io/eks-charts
helm repo update
helm install aws-load-balancer-controller eks/aws-load-balancer-controller  -n kube-system -f ../values.yml

```bash
