
# terraform-sample

# 概要
terraform使用してAWSのインフラ自動構成しています。
Rails用のインフラ自動構成です。
moduleを使用してdev(開発環境)とprd(本番環境)を自動に作成できます。
それぞれの環境ごとにIPアドレスが違います。※１　インフラ構成図参照
dev(開発環境）ではポート２２、８０、３０００番が組み込まれているので組込みサーバーとして使用できます。
prd(本番環境)ではポート２２、８０番のみ組み込んでいるのでNginxやUnicornなのWebサーバー &APサーバーとして使用できます。

# terraformのディレクトリ構成図

tf-sample
├── module
│   ├── ALB
│   │   ├── mainf.tf
│   │   ├── output.tf
│   │   └── variables.tf
│   ├── EC2
│   │   ├── mainf.tf
│   │   ├── output.tf
│   │   └── variables.tf
│   ├── EC2SG
│   │   ├── mainf.tf
│   │   ├── output.tf
│   │   └── variables.tf
│   ├── RDS
│   │   ├── mainf.tf
│   │   ├── output.tf
│   │   └── variables.tf
│   ├── ROUTE
│   │   ├── mainf.tf
│   │   ├── output
│   │   └── variables.tf
│   ├── SUBNET
│   │   ├── mainf.tf
│   │   ├── output.tf
│   │   └── variables.tf
│   └── VPC
│       ├── mainf.tf
│       ├── output.tf
│       └── variables.tf
├── dev(開発環境)
│   └── main.tf (VPC・SUBNET・ROUTE・EC2・EC2SG・RDS)
└── prd(本番環境)
    └── main.tf(VPC・SUBNET・ROUTE・EC2・EC2SG・RDS・ALB)
    

# terraformのインフラ構成図

