variable "region" {
  type        = string
  description = "AWS Region on which to create resources."
  default     = "us-east-1"
}

variable "step_function_name" {
  type = string
  description = "Step Function Name"
  default = "Automation_step_function"
}