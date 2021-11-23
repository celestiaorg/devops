#!/bin/sh

# Retrieve binary
wget https://fra1.digitaloceanspaces.com/celestia-node-binaries/celestia
wget https://github.com/stedolan/jq/releases/download/jq-1.6/jq-linux64

# Change binary permissions
chmod +x celestia
chmod +x jq-linux64

# init full node
./celestia full init

#replace keys
cp nodekey0 ~/.celestia-full/keys/OAZHALLLMV4Q

# restrict keys permissions
chmod 0600 ~/.celestia-full/keys/OAZHALLLMV4Q

# replace config
cp boot-config0.toml ~/.celestia-full/config.toml