# Step Function

[AWS Step Function](https://docs.aws.amazon.com/step-functions/latest/dg/welcome.html) is a serverless orchestration service that lets you integrate with AWS Lambda functions and other AWS services to build business-critical applications. Through Step Functions' graphical console, you see your application’s workflow as a series of event-driven steps.

In this code, we have step function defined to run two Lambda functions i.e. [Lambda_one](../LambdaFunction/Lambda_one/) and [Lambda__two](../LambdaFunction/Lambda_two/) step by step.

![Step Function](./Assets/state_machine_definition.png)

## Terraform execution

<details>
<summary>terraform init</summary>

```terraform
terraform init
```

![terraform init](./Assets/iniit.png)
</details>

<details>
<summary>terraform plan</summary>

```terraform
terraform plan
```

![terraform plan](./Assets/plan_1.png)
![terraform plan](./Assets/plan_2.png)
</details>

<details>
<summary>terraform validate</summary>

```terraform
terraform validate
```

![terraform validate](./Assets/validate.png)
</details>

<details>
<summary>terraform apply</summary>

```terraform
terraform apply
```

![terraform apply](./Assets/apply_1.png)
![terraform apply](./Assets/apply_2.png)
![AWS deployed](./Assets/deployed_stepfunction.png)
![Step Function Definition](./Assets/definition.png)
</details>

### Test Execution

Test the execution by providing following input to step function :

```JSON
{
  "client_name": "Adidas"
}
```

The step function executes successfully :
![Step Function SUCCESS](./Assets/success_stepfunction.png)
![Step Function IO](./Assets/input_output.png)
