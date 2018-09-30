# ansible-sample

Dockerコンテナ上でansible環境を構築し、ホストPCからリモート接続先の環境を構築す
る。

## 実行の仕組み

Makefileを読めばわかるが、Dockerfile内にPythonとSSH環境を構築し、
接続先の情報をホストPCの.sshディレクトリをdockerコンテナ内にマウントして
docker-playbookを実行している。

## 実行方法

下記のコマンドを実行する。

```bash
make
make run-ansible
```

今回の例ではパスワード認証があるパターンを想定して
-kを設定。接続後にsudoコマンドを実行するので--ask-become-passを設定している。
SSH接続方法は環境によってことなると思うので必要に応じて変更する。
