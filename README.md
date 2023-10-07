# knowledge-network
Prolog solution for complex calculations.

## How to run
1. Install okp4d

## Follow okp4d repository

[okp4d repo](https://github.com/okp4/okp4d)

2. Run `okp4d` in the project directory

```bash```
okp4d query wasm contract-state smart okp41xu7vcavaj3w2yputv9cu0uk0jueldgl3pw7sfd9ateayvztgry2snql05s \
    --node https://api.testnet.okp4.network:443/rpc \
    "{\"ask\": {\"query\": \"is_correct_amount_vote(2,log(100) / log(10)).\"}}"
```
