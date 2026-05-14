# denode

> 日本語のREADMEはこちらです: [README.ja.md](README.ja.md)

A project demonstrating how to run Deno and Node.js together in a single Docker container. This repository provides two approaches.

## Approaches

1.  **Deno with Node.js (Default)**: Uses the official `denoland/deno` image as a base and installs Node.js via `apt-get`. This is the recommended and default configuration.
2.  **Node.js with Deno**: Uses the official `node` image as a base and installs Deno via its install script. This approach has known compatibility issues on some system architectures.

## Requirements

*   Docker
*   Docker Compose

## Usage

### Approach 1: Deno with Node.js (Default)

This method uses the `Dockerfile` and is configured in `docker-compose.yml`. The entry point is `fordeno.js`, a Deno script that executes a Node.js script.

1.  **Build and start the container:**
    ```shell
    docker-compose build
    docker-compose up
    ```

2.  **Stop and remove the container:**
    ```shell
    docker-compose down
    ```

### Approach 2: Node.js with Deno

This method uses the `nodeno.Dockerfile`. The entry point is `fornode.mjs`, a Node.js script that executes a Deno script.

1.  **Build the Docker image:**
    ```shell
    docker build -t denode-node-first -f nodeno.Dockerfile .
    ```

2.  **Run the container:**
    ```shell
    docker run --rm denode-node-first
    ```

## Known Issues

The "Node.js with Deno" approach (`nodeno.Dockerfile`) may fail during the Deno installation on non-x86_64 architectures (e.g., Apple Silicon/ARM64). The pre-compiled Deno binary is not compatible, resulting in the following error:

```
qemu-x86_64: Could not open '/lib64/ld-linux-x86-64.so.2': No such file or directory
```

The default Deno-first approach is provided as a working solution to this problem.

## License

MIT License — see [LICENSE](LICENSE).