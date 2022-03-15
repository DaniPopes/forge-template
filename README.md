# Forge Template

A template for quickly getting started with Forge.

## Getting Started

```sh
mkdir my-project
cd my-project
forge init --template https://github.com/DaniPopes/forge-template

# Update libraries
make update

# Install development dependencies
yarn

# Run tests
make test
# or
make trace
```

## Features

### Testing Utilities

Includes the Forge cheat codes interface (`VM`), the `console` library and other testing utilities from `forge-std` and `ds-test`, all bundled up in `src/test/utils/BaseTest.sol`.

### Libraries

[`@Rari-Capital/solmate`](https://github.com/Rari-Capital/solmate) and [`@brockelmore/forge-std`](https://github.com/brockelmore/forge-std).

### Scripts

`Prettier` and `Solhint` are pre-configured with [official style recommendations](https://docs.soliditylang.org/en/latest/style-guide.html).

Makefile includes 

## Acknowledgements

Inspired by [@Gakonst](https://github.com/gakonst/)'s and [@FrankieIsLost](https://github.com/FrankieIsLost/forge-template)'s forge templates.
