# Introduction 

The Terraform creates the complete Infrastrcuture for Sandbox CADT for any Environment we want to create . 
The Terraform Code comprises of following component

1) Vnet 
2) Azure Kubernetes Service
3) Azure Container Registry
4) Azure KeyVault
5) NAT Gteway


# Getting Started

To Initialize the Script , Please run 

```bash
terraform init
```

# Build and Test

Once your Code is ready , you can check if desired resources are created , updated or destroyed using a dry run check using 

```bash
terraform plan
```

Once you are satisfied with the desired output in dry run, Please run 

```bash
terraform apply
```

### Workspaces - How to Select Environment to Create

Terraform Workspace defines and create a separate unit for each environment using same code with different variables
The Code uses workspace to diffentiate between environments

The Environments are
1) default - dev
2) prod - MAIN 


To Switch between environment use below 

```bash
terraform workspace select <Environment>
```

To Make new Environment 

```bash
terraform workspace new <Environment>
```


* Note : When creating new environement, please configure the lookup tables in confg.tf file and respective values





