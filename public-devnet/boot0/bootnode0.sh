#!/bin/sh

# Sleep to wait for the celestia-appd container to come up
sleep 2

genesis_hash=$(curl 127.0.0.1:26657/block?height=1 -s | ./jq-linux64 .result.block_id.hash | tr -d '"')

./celestia full start --core.remote tcp://127.0.0.1:26657 --headers.genesis-hash $genesis_hash