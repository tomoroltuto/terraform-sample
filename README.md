
# terraform-sample

terraform-sampleは、terraformを利用しAWSのインフラ自動構成ができます。

# terraformのディレクトリ構成

![terraform-Directory- configuration-diagram](https://user-images.githubusercontent.com/90845405/147535054-9fa1d6fe-08ac-41ec-8222-911539cc1f60.jpg)

# terraformのインフラ構成図
![terraform Diagram](https://user-images.githubusercontent.com/90845405/147536223-3cffde63-736e-41e2-8a58-389d576e571e.jpg)

# 特徴

* AWScloud9上で作成しています。

* Rails用のインフラ自動構成です。

* ディレクトリ構成はmodule機能を利用してdev(開発環境)とprd(本番環境)を自動に作成できるようになってます。※ディレクトリ構成参照

* applyした際の状態を記録したtfstateファイルはS3に自動で保存されます。

* それぞれの環境ではCIDRを別々にしています。※インフラ構成図参照

* dev(開発環境）ではポート22・80・3000番で識別・指定しており、組み込みサーバーとして利用できます。

* prd(本番環境)ではポート22・80番で識別・指定しており、Unicorn,NginxをインストールすることでWebサーバー&APサーバーを利用できます。

  ※EC2の中には何もインストールされてません。

# Requirement

* cloud9　Configuration
```bash
    Environment type = Create a new EC2 instance for environment(direct access)
    
    Instance type = t2.micro
  
    Platform =  Amazon Linux 2
```    
* Engine_version 
```bash
     mysql 8.0
```
* Terraform_version
```bash
     V 1.1.1
```    
# Install
```bash
     $ sudo yum install -y yum-utils
     
     $ sudo yum-config-manager --add-repo https://rpm.releases.hashicorp.com/AmazonLinux/hashicorp.repo
     
     $ sudo yum -y install terraform
     
     $ terraform -install-autocomplete
     
     $ . ~/.bashrc
```      
# Usage

 * File settings

     ~/terraform-sample/dev 　 or　 ~/terraform-sample/prd
     
 * Create an S3 bucket

  ```bash
     $ aws s3 mb s3://bucket-name
  ``` 
 * Change the S3 packet name in main.tf of each environment
 
     ~/dev/main.tf  　or  　~/prd/main.tf
     
  ```bash    
     bucket = "bucket-name"
  ```   
 * command
 ```bash
    
     $ terraform init
    
     $ terraform plan
    
     $ terraform apply
    
 ```  
