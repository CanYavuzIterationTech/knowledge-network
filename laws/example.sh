#!/bin/bash

set -euo pipefail

okp4d query wasm contract-state smart okp41xu7vcavaj3w2yputv9cu0uk0jueldgl3pw7sfd9ateayvztgry2snql05s \
    --node https://api.testnet.okp4.network:443/rpc \
    "{\"ask\": {\"query\": \"is_correct_amount_vote(2,log(100) / log(10)).\"}}"