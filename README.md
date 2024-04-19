# sandbox-composer-install-on-userdata

「EC2のユーザデータ内でcomposer installを実行する際には、 HOME か COMPOSER_HOME のどちらかが環境変数としてないと以下のエラーが出て実行に失敗するため注意しましょう。」といったことを体験できるスクリプト

```
The HOME or COMPOSER_HOME environment variable must be set for composer to run correctly
```

# Usage

## 失敗例
- userdata-fail.sh の中身をEC2インスタンスのユーザデータとして使用し、そのインスタンスを起動する
- 起動後、そのインスタンス内に入る
- `less /home/ec2-user/example/result.log` を実行して、何も表示されないことを確認する

## 成功例
- userdata.sh の中身をEC2インスタンスのユーザデータとして使用し、そのインスタンスを起動する
- 起動後、そのインスタンス内に入る
- `less /home/ec2-user/example/result.log` を実行して、「NNow: 2024-04-19 12:34:56」のような文字列が表示されることを確認する