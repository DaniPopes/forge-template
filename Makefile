# include .env file and export its env vars
# (-include to ignore error if it does not exist)
-include .env

# Dependencies
update		:; forge update

# Lint
lint		:; yarn lint

# Build & test
clean		:; rm -rf cache && rm -rf out && forge clean --root .
build		:; make clean && forge build --root .
test		:; make build -s && forge test --root .
trace		:; make build -s && forge test -vvv --root .
tests		:; make build && forge test -vvvvv --root .
snapshot	:; make build -s && forge snapshot --root .

# Transactions
# Any env var can be set in .env or in the command (e.g. VALUE="123" cast call ...)
# Use $ETH_FROM and $KEYSTORE_PASSWORD for ethsign or $KEYSTORE_PATH for own keystore
# $VALUE is parsed as hexadecimal

# Call
# make call <ADDRESS> <SIG> [ARGS]...
call		:; cast ${MAKECMDGOALS} --password ${KEYSTORE_PASSWORD}

# Send
# make send <TO> <SIG> [ARGS]...
send		:; cast ${MAKECMDGOALS} --password ${KEYSTORE_PASSWORD} --value ${ETH_VALUE}

# Deploy
# $ARG<N> for any constructor arguments
# make create <CONTRACT_NAME>
create		:; make build -s && forge ${MAKECMDGOALS} --password ${KEYSTORE_PASSWORD} --constructor-args ${ARG_1} --constructor-args ${ARG_2} --constructor-args ${ARG_3}
