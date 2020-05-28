# Demo for Packet 2020 SKO
This repo will help you deploy a Packet server via Terraform for the first time on a windows machine or a Mac. (Linux folks you can figure this out...)

## Downloads
Download the following items for your respective OS
### Windows
If you have a windows machine you need to create a folder that has a file structure similar to this:
* Folder_Name
  * [main.tf](https://raw.githubusercontent.com/packet-labs/api-training/master/main.tf)
  * [terraform.tfvars](https://raw.githubusercontent.com/packet-labs/api-training/master/terraform.tfvars)
  * [putty.exe](https://the.earth.li/~sgtatham/putty/latest/w32/putty.exe)
  * [puttygen.exe](https://the.earth.li/~sgtatham/putty/latest/w32/puttygen.exe)
  * [terraform.exe](https://releases.hashicorp.com/terraform/0.12.26/terraform_0.12.26_windows_386.zip) ****Requires being unzipped***

### Mac
If you are using a Mac you'll need fewer files:
* Folder_Name
  * [main.tf](https://raw.githubusercontent.com/c0dyhi11/packet-sko-2020/master/my_plan.tf)
  * [terraform.tfvars](https://raw.githubusercontent.com/packet-labs/api-training/master/terraform.tfvars)
  * [terraform](https://releases.hashicorp.com/terraform/0.12.26/terraform_0.12.26_darwin_amd64.zip) ****Requires being unzipped***


## Data gathering

### API Key
Login to the Packet UI and click on your picture at the top right corner and choose ***API Keys.*** If you already have an API Key with Read/Write permissions, copy the ***token***. If you need one click the green ***+Add*** in the top right. Then give it a ***Description*** and ensure the permissions are ***Read/Write***. Once that is created, copy the ***token*** for later.

### Project ID
Login to the Packet UI and navigate to the ***Project*** you want to deploy your server into. Once on that project choose ***PROJECT SETTINGS*** at the top of page. On this page you will see a Project ID that looks similar to ***25bc4342-0a9b-4481-b7ca-76e87f5a85be***. Copy this for later.


## Update your terraform.tfvars
Use the ***API Key*** and the ***Project ID*** gathered in the previous steps, as well as a ***DNS Friendly Name*** (No space, Capitals, or Symbols). Then update these values in your ***terraform.tfvars*** file.


## Deploy your plan
Doing this will be different per OS, please follow the instructions for your OS.

### Windows
Open a ***command***/***powershell*** prompt and navigate to your folder you created in the ***Downloads*** section above.

Now you need to use Terraform to download all of the plugins were going to use to deploy our server. 

```bash
terraform.exe init
```
Now you need to apply you plan
```bash 
terraform.exe apply
```
This will show you an output of what will be created, and you will need to type ***yes*** and press enter to deploy your stack.

### Mac
Open your ***Terminal*** application and navigate to the folder you created in the ***Downloads*** section above.

Now you need to use Terraform to download all of the plugins were going to use to deploy our server. 

```bash
./terraform init
```
Now you need to apply you plan
```bash 
./terraform apply
```
This will show you an output of what will be created, and you will need to type ***yes*** and press enter to deploy your stack.

## Connecting to you server
Connecting to your server will be different for each OS, follow the instructions for your OS below.

### Windows
#### SSH Key Madness
Windows machines don't handle Secure Shell (SSH) natively at all. The makes us need to use third party utilities such as ***Putty*** and ***PuttyGen*** to work with SSH and SSH Keys respectively.

First we will need to convert the private SSH key into a ***Putty*** useable file.

Do this by double clicking on ***PuttyGen*** then choosing Load towards the mid-right of the app, and select the file named ***my_tf_ssh_key*** (You will need to choose `"All Files (*.*)"` in the bottom right to find this file).

You will be prompted that your key Sucessuflly imported. Click ***OK***.

Now choose ***Save private key*** (You will be prompted to confirm that you want to save the key without a password, click ***Yes***.)

Save the file into the same folder and name it ***putty_tf_ssh_key***.

#### Connect to Server
Now you can launch Putty and connect to your sever.

Double click on ***putty.exe*** type in the ***IP_Address*** from the Terraform output.

Now on the left menu expand ***ssh*** under ***Connection*** and click on ***Auth***.

Now click ***Browse*** and choose the ***putty_tf_ssh_key*** you created in the previous step.

Now click ***Open***. (You will be prompted to confirm you know this server. Click ***yes***)

Lastly type in your username ***root*** and press ***enter***.


Done!


### Mac
On a Mac connection to a linux server is extreamly easy. All you will have to do is record the ***IP_Address*** from the Terraform output once the plan is done running. And use that IP address in the following command:
```bash
ssh -i my_tf_ssh_key root@<terraform_ip_address>
```

Done!
