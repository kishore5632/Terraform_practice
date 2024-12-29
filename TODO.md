structure:

/modules
  /ec2
    main.tf
    variables.tf
    outputs.tf
main.tf (root)
variables.tf (root)
outputs.tf (root)


export AWS_ACCESS_KEY_ID="your-access-key"
export AWS_SECRET_ACCESS_KEY="your-secret-key"


[default]
aws_access_key_id = your-access-key
aws_secret_access_key = your-secret-key


export AWS_REGION="ap-south-1"

terraform init
terraform workspace new dev
terraform plan
terraform apply


