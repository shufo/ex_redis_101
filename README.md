# ExRedis101

Getting Started Elixir and Redis with TDD.

## Usage

- Clone this repository

```bash
$ git clone https://github.com/shufo/ex_redis_101
```

- Get dependencies

```bash
$ mix deps.get
```

- Run redis (using docker)

```bash
$ docker run -d -p 6379:6379 --name redis redis:alpine
```

- Write the modules to pass the tests

```
$ mix test
```

- Pull Request the your code

- Test results is shown in here

https://circleci.com/gh/shufo/ex_redis_101

## Contribution

- Run formatter before commit to Git

```
$ mix format
```
