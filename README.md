# Forge Template

A template for quickly getting started with forge.

## Getting Started

```bash
mkdir my-project
cd my-project
forge init --template https://github.com/DaniPopes/forge-template

## initialize submodule dependencies
git submodule update --init --recursive

## install development dependencies
yarn

## copy .env.example to .env and modify it to deploy contracts
cp .env.example .env
nano .env
```

## Features

### Testing Utilities

Includes common testing contracts like `VM.sol` and `Console.sol`, as well as a `Utilities.sol` contract with common testing methods like creating users with an initial balance.

### Dependencies

`ds-test` and `solmate` are already installed.

### Scripts

Pre-configured `prettier` and `solhint`. Yarn is used for linting, make for everything else.

```bash
make build
make test
make trace
make clean
make snapshot

make lint

yarn lint
yarn lint:check
```

## Acknowledgements

Inspired by [@Gakonst](https://github.com/gakonst/)'s and [@FrankieIsLost](https://github.com/FrankieIsLost/forge-template)'s forge templates.
