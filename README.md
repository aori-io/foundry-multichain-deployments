# Multichain Deployments through Foundry

This is a template for a Foundry project that deploys to multiple chains.

## Local development

This project uses [Foundry](https://github.com/gakonst/foundry) as the development framework.

### Dependencies

```
forge install
```

### Compilation

```
forge build
```

### Testing

```
forge test
```

## Deployment

Contract deployment happens in the `script/Deploy.s.sol` script file under the `DeployScript::run` function.

### Setting Environment Variables
Only two environment variables are required, as depicted within `.env.example`. Copy the contents of `.env.example` into a `.env` file and add a `DEPLOYER_PRIVATE_KEY`:

```
=== .env ===

# Deployer Private Key
DEPLOYER_PRIVATE_KEY=<private key of deployer>

# Aori's CREATE3Factory details can be found here: 
CREATE3FACTORY_ADDRESS=0x2Dfcc7415D89af828cbef005F0d072D8b3F23183
```



### Deterministic Contract Deployments

The base deployment script makes use of `CREATE3` to deterministically deploy contracts to some address that can be pre-computed before deployment. A salt is one of these inputs, for which we construct salts from 'version tags' - this adds standardisation to how these addresses are generated.

To bump a version, update the `CONTRACT_VERSION` value defined within `DeployScript::run`. If a previous deployment was made for a given version, it is very possible to compute the address and check for the existence of a smart contract deployed to there to avoid attempting to re-deploy.

### Adding a New Network

A number of networks are already included as options to deploy to. These are defined under the `[rpc_endpoints]` section in the `foundry.toml` file. By adding an appropriate RPC link for that chain as per the other examples, it can then be referenced within the deployment script.

```
=== foundry.toml ===

...
[rpc_endpoints]
mainnet = "https://rpc.ankr.com/eth"
sepolia = "https://rpc.ankr.com/eth_sepolia"
example-chain = "https://example.com/rpc" # <- This is an example
...
```


You can choose to update, edit or delete certain chains if you would like.
### Making the Deployment

You can run a test of the chain deployments by running
```
make test-deploy
```

You can finally broadcast the deployment by running
```
make deploy
```




