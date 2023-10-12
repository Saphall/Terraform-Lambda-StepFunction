# Terraform-Lambda-StepFunction

Terraform Script to deploy Lambda Function and Step Function.

* [Lambda Function](./LambdaFunction/) - used to perform two tasks i.e. check 'client_name' and return database creation message using two lambdas : [Lambda_one](./LambdaFunction/Lambda_one/) and [Lambda_two](./LambdaFunction/Lambda_two/).
* [Step Function](./StepFunction/) - used to invoke the lambdas.

## Terraform Execution

```terraform
terraform init
terraform plan
terraform validate
terraform apply
```
