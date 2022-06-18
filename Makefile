# include .env file and export its env vars
# (-include to ignore error if it does not exist)
-include .env

# Lint & format
fmt			:; yarn fmt
lint		:; yarn lint

# Build & test
build		:; forge build --root .
clean		:; rm -rf cache && rm -rf out && forge clean --root .
gas			:; forge test --root . --gas-report
snapshot	:; forge snapshot --root .
test		:; forge test --root .
logs		:; forge test -vv --root .
trace		:; forge test -vvv --root .
trace_all	:; forge test -vvvv --root .
trace_setup	:; forge test -vvvvv --root .
