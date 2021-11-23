#!/bin/sh

# TODO(Josh): Placeholder file to create single wrapper script that standups entirely of devnet
# Phase 1. Assume that a kubernetes cluster exists and the runner of the script has access to it.
# Phase 2. Assume that there are no existing cloud resources.

# Steps
# 1. Create multiple celestia-app account keys
# https://github.com/celestiaorg/networks/blob/master/scripts/1_create_key.sh
# 2. Gather account addresses from (1)
# 3. Initialize Chain
# https://github.com/celestiaorg/networks/blob/master/scripts/creator.sh
# 4. Add all accounts to genesis.json
# 5. Copy genesis.json to all nodes
# 6. Create genesis transactions (gentxs) for all nodes
# 7. Gather all node's gentxs in a single directory
# 8. run `celestia-appd collect gentxs` to create golden genesis.json
# 9. Copy golden genesis.json to all nodes
# 10. Start all nodes with `celestia-appd start`
# 11. Verify successful block production