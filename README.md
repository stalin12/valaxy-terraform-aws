# valaxy-terraform-aws
1. Go Inside the valaxy-infra directory
2. Execute "terraform init"
3. Execute terraform plan
4. Execute terraform apply

Before executing above terraform commands, please make sure you have terraform and aws cli has been installed on your system.
Once Aws cli has been installed, make sure inside your home directory there is a folder called .aws. inside that directory you configure your aws credntials with profile. Once that is configured use that profile inside provisioner module of terraform.
