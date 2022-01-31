# default env
OPTIMIZE_RUNS=1000000
# include .env file and export its env vars
# (-include to ignore error if it does not exist)
-include .env

# Dependencies
update		:; forge update

# Build & test
clean		:; forge clean
build		:; forge clean && forge ${MAKECMDGOALS} --optimize --optimize-runs ${OPTIMIZE_RUNS}
test		:; forge clean && forge ${MAKECMDGOALS} --optimize --optimize-runs ${OPTIMIZE_RUNS}
trace		:; forge clean && forge test --optimize --optimize-runs ${OPTIMIZE_RUNS} -vvv
snapshot	:; forge clean && forge ${MAKECMDGOALS} --optimize --optimize-runs ${OPTIMIZE_RUNS}

# Lint
lint		:; yarn lint

# Deploy
# use with make create <CONTRACT_NAME> (--constructor-args <ARGUMENT_N> for N arguments, if any)
create		:; forge clean && forge ${MAKECMDGOALS} --private-key ${PRIVATE_KEY} --rpc-url ${RPC_URL} --optimize --optimize-runs ${OPTIMIZE_RUNS}
