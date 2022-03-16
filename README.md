**Instructions:**
# Install aws IAM authenticator download before you can interact with your cluster
# use this link https://docs.aws.amazon.com/eks/latest/userguide/install-aws-iam-authenticator.html
# curl -o aws-iam-authenticator.sha256 https://amazon-eks.s3.us-west-2.amazonaws.
# com/1.21.2/2021-07-05/bin/linux/amd64/aws-iam-authenticator.sha256
# chmod +x ./aws-iam-authenticator
# mkdir -p $HOME/bin && cp ./aws-iam-authenticator $HOME/bin/aws-iam-authenticator && export PATH=$PATH:$HOME/bin
# echo 'export PATH=$PATH:$HOME/bin' >> ~/.bashrc
# aws-iam-authenticator help



Before running the terraform commands:

1) configure your enviroment with your AWS access key and secret access key. 
2) use the command AWS configure to enter access key and secret access key
3) clone the repository to your envirment with the git clone command
4) cd into amelieolga
5) run terraform init
6) run terraform plan
7) run terraform apply --auto-approve


