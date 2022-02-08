## My smart contract notes in 2022


## Goals: ##

- Understand smart contract proxies (embrace immutability), how it use assembly codes to delegate OPCODES.
- Get really good at solidity
- Tokenomics

## Development Notes ##


__1. Development Server:__

I started using [Ganache](https://trufflesuite.com/ganache/) as Ethereum local node, now I moved to using [Go Ethereum](https://geth.ethereum.org/)

__2. Run:__

```bash
geth --http --http.corsdomain="*" --http.api web3,eth,debug,personal,net --vmdebug --datadir $HOME/persist-geth --dev console --allow-insecure-unlock
```

where `persist-geth` is the *geth persistence folder*

Spawns a local EVM node at ```8545```.

Connect with Metamask with chain ID ```1337```

#### Some notes with `--allow-insecure-lock`:

I was trying to making some transactions with some newly created accounts in geth node, the command to create new account:

```bash
geth account new --datadir $HOME/persist-geth
```

Error will happen when the account is not unlocked.
```
creation of xxxx errored: Returned error: authentication needed: password or unlock
```

__👀 Reason:__

[Unlock Account](https://web3js.readthedocs.io/en/v1.2.11/web3-eth-personal.html#unlockaccount) is forbidden via when connecting to node via HTTP.

See PR: https://github.com/ethereum/go-ethereum/pull/17037

__🏁 Solutions:__

Run with web3 API to unlock the account.

``` bash
web3.personal.accounts.unlockAccount("0x....", "SAFE-PASSWORD-BLAH-BLAH", null)
```

Duration time `null` is OK, for development I need the account to be unlocked indefinitely.

