
# 1.terraform-sample

# 2.概要
terraform使用してAWSのインフラ自動構成しています。
Rails用のインフラ自動構成です。
moduleを使用してdev(開発環境)とprd(本番環境)を自動に作成できます。
それぞれの環境ごとにIPアドレスが違います。※１　インフラ構成図参照
dev(開発環境）ではポート２２、８０、３０００番が組み込まれているので組込みサーバーとして使用できます。
prd(本番環境)ではポート２２、８０番のみ組み込んでいるのでNginxやUnicornなのWebサーバー &APサーバーとして使用できます。

# 3.terraformのディレクトリ構成図

![terraform-Directory- configuration-diagram](https://user-images.githubusercontent.com/90845405/147535054-9fa1d6fe-08ac-41ec-8222-911539cc1f60.jpg)

# 4.terraformのインフラ構成図
![terraform Diagram](https://user-images.githubusercontent.com/90845405/147535092-71bd24f9-9c55-4e42-bbec-b460f5375c9c.jpg)
