#!/bin/bash
mkdir -p $1/node_modules/cosmjs-types/ethermint/types/v1/
cp ./account/* $1/node_modules/cosmjs-types/ethermint/types/v1/
insert="case '/ethermint.types.v1.EthAccount': {const ethermint_1 = require('cosmjs-types/ethermint/types/v1/account');const baseAccount = ethermint_1.EthAccount.decode(value).baseAccount; utils_1.assert(baseAccount);return accountFromBaseAccount(baseAccount);}"
escaped_insert=$(printf '%s\n' "$insert" | sed -e 's/[\/&]/\\&/g')
file=$1/node_modules/@cosmjs/stargate/build/accounts.js
if [[ "$OSTYPE" == "darwin"* ]]; then
        sed -i '' "s/default:/${escaped_insert}\n\t\tdefault:/" $file
    else
        sed -i "s/default:/${escaped_insert}\n\t\tdefault:/" $file
fi