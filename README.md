# Cloud-Project

This project is done by : Vanujan SELVARAJAH & Andritsara CHAN PENG

The goal of this project is to deploy a WordPress website on our own server.

## Plan of the project

  1. Create an Ansible playbook to enable the installation of a WordPress website on our server, for that we will use a tutoriel from this website "https://dotlayer.com/how-to-use-an-ansible-playbook-to-install-wordpress/"
  2. Create a server on Scaleway with Terraform
  3. Create an image with Packer
  

#### Command for Ansible: playbook.yml

- cd cloud-courses/ansible/ 
- Run ansible -m ping all -i hosts to test if we can connect to the server by pinging it with Ansible
- Run ansible-playbook playbook.yml -i hosts -u root -K
- Verify by typing on the browser the IP address of our server, and verify that there is a WordPress Site 

#### Command for Terraform: main.tf

- cd cloud-courses
- Run terraform init
- Run terraform plan
- Run terraform apply
- Verify in our scaleway account that the server has been created sucesfully

#### Command for Packer: template.json

- cd cloud-courses/ansible (because we are gonna use our playbook.yml file as provisionners)
- Run packer validate template.json (to verify if our template.json file is configurate correctly)
- Run packer build template.json
- Verify in our scaleway account that the image has been created succesfully 

