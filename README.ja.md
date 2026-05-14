# denode

DenoとNode.jsを単一のDockerコンテナ内で一緒に実行する方法を示すプロジェクトです。このリポジトリでは2つのアプローチを提供しています。

## アプローチ

1.  **Deno with Node.js (デフォルト)**: 公式の`denoland/deno`イメージをベースとして使用し、`apt-get`でNode.jsをインストールします。これが推奨されるデフォルトの構成です。
2.  **Node.js with Deno**: 公式の`node`イメージをベースとして使用し、インストールスクリプトでDenoをインストールします。このアプローチは、一部のシステムアーキテクチャにおいて互換性の問題があることが知られています。

## 要件

*   Docker
*   Docker Compose

## 使用方法

### アプローチ1: Deno with Node.js (デフォルト)

この方法では`Dockerfile`を使用し、`docker-compose.yml`で設定を行っています。エントリポイントは`fordeno.js`であり、これはNode.jsスクリプトを実行するDenoスクリプトです。

1.  **コンテナのビルドと起動:**
    ```shell
    docker-compose build
    docker-compose up
    ```

2.  **コンテナの停止と削除:**
    ```shell
    docker-compose down
    ```

### アプローチ2: Node.js with Deno

この方法では`nodeno.Dockerfile`を使用します。エントリポイントは`fornode.mjs`であり、これはDenoスクリプトを実行するNode.jsスクリプトです。

1.  **Dockerイメージのビルド:**
    ```shell
    docker build -t denode-node-first -f nodeno.Dockerfile .
    ```

2.  **コンテナの実行:**
    ```shell
    docker run --rm denode-node-first
    ```

## 既知の問題

「Node.js with Deno」アプローチ（`nodeno.Dockerfile`）は、x86_64以外のアーキテクチャ（例: Apple Silicon/ARM64）において、Denoのインストール中に失敗する可能性があります。コンパイル済みのDenoバイナリに互換性がないため、以下のエラーが発生します。

```
qemu-x86_64: Could not open '/lib64/ld-linux-x86-64.so.2': No such file or directory
```

デフォルトのDenoファーストのアプローチは、この問題に対する有効な解決策として提供されています。

## ライセンス

MIT License — 詳細は[LICENSE](LICENSE)を参照してください。
