import artifact from'../../contracts/ToDo.sol';
import Web3 from 'web3';
import TruffleContract from 'truffle-contract';
import config from './config.js';
web3 = new Web3("http://127.0.0.1:8545");

web3.setProvider(new Web3.providers.HttpProvider(config.ethereumUrl));

const abstraction = new TruffleContract(artifact);
abstraction.setProvider(web3.currentProvider);

const network = Object.keys(artifact.networks)[0];
const address = artifact.networks[network].address;

abstraction.at(address).then((todo) =>{
  console.log(todo);
})
