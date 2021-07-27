Ways to pass parameter values (ordered by precedence):

1. Define env variable, .e.g, export TF_VAR_env_name="production"

2. terraform apply -var-file=params.tfvars

3. to create a .auto.tfvars files. The parameters set in this file will be picked up automatedly

4. terraform apply -var="env_name=prod"

(https://www.terraform.io/docs/language/values/variables.html#variable-definition-precedence)

