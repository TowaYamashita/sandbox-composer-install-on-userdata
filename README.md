# sandbox-composer-install-on-userdata

「EC2のユーザデータ内でcomposer installを実行する際には、 HOME か COMPOSER_HOME のどちらかが環境変数としてないと以下のエラーが出て実行に失敗するため注意しましょう。」といったことを体験できるスクリプト

```
The HOME or COMPOSER_HOME environment variable must be set for composer to run correctly
```

# Usage

## 準備
- Amazonlinux2が動く適当なEC2インスタンスを起動する
- 起動後、そのインスタンス内に入る
- 以下のコマンドを実行する
```shell
[ec2-user@ip-X-X-X-X ~]$ sudo su -
[root@ip-X-X-X-X ~]# vim /root/setup.sh
# setup.shの中身をコピペする
[root@ip-X-X-X-X ~]# chmod +x /root/setup.sh
[root@ip-X-X-X-X ~]# sh /root/setup.sh
[root@ip-X-X-X-X ~]# rm -f /root/setup.sh
```
- インスタンスを停止する
- 停止後、そのインスタンスを使ってAMIを作成する

## 失敗例
- 以下のように設定し、インスタンスを起動する
  - AMI: 準備で作成したAMIを使う
  - ユーザデータ: userdata-fail.sh の中身
- 起動後、そのインスタンス内に入る
- `less /home/ec2-user/example/result.log` を実行して、何も表示されないことを確認する

## 成功例
- 以下のように設定し、インスタンスを起動する
  - AMI: 準備で作成したAMIを使う
  - ユーザデータ: userdata.sh の中身
- 起動後、そのインスタンス内に入る
- `less /home/ec2-user/example/result.log` を実行して、「NNow: 2024-04-19 12:34:56」のような文字列が表示されることを確認する