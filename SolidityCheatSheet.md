# Solidity CheatSheet

## Contracts

#### Minimal Contract

```javascript
// compiler version
pragma solidity ^0.5.0;

// contract declaration
contract BasicContract {
    // contract constructor
    constructor() public {
    }
}
```

## Visibility

Functions have to be specified as being external, public, internal or private. For state variables, external is not possible.

- `external`: External functions are part of the contract interface, which means they can be called from other contracts and via transactions. An external function f cannot be called internally (i.e. f() does not work, but this.f() works). External functions are sometimes more efficient when they receive large arrays of data.
- `public`: Public functions are part of the contract interface and can be either called internally or via messages. For public state variables, an automatic getter function (see below) is generated.
- `internal`: Those functions and state variables can only be accessed internally (i.e. from within the current contract or contracts deriving from it), without using this.
- `private`: Private functions and state variables are only visible for the contract they are defined in and not in derived contracts.

> Everything that is inside a contract is visible to all observers external to the blockchain. Making something private only prevents other contracts from accessing and modifying the information, but it will still be visible to the whole world outside of the blockchain.

## Types

#### Basic Types

```javascript
bool someBoolean	 = true;
int someSignedInt	 = -300;
uint someUnsignedInt     = 300;
string someString	 = "hello world";
bytes32 some32Bytes	 = "hello world";
```

#### Arrays

```javascript
// array declaration
uint[] myArray;

// adding to an array
myArray.push(123);

// deleting an element
delete myArray[1];
myArray.length--; // needs to manually be decremented
```

#### Advanced Types

##### Adresses

The address type is used to store addresses, **user adresses** and **contract adresses**.

```
address ownerAdress;
```

Using Solidity's `address()` method we can get a contract's address.

```javascript
MyContract foo = new MyContract();
address contractAddr = address(foo);
```

##### Mappings

```javascript
mapping(string => uint) myMap;
myMap["myKey"] = 10;

mapping(string => uint[]) myArrayMap;
myArrayMap["myKey"].push(10);

```

#### Block and Transaction Properties

- `blockhash(uint blockNumber) returns (bytes32)`: hash of the given block - only works for 256 most recent, excluding current, blocks
- `block.coinbase (address payable)`: current block miner’s address
- `block.difficulty (uint)`: current block difficulty
- `block.gaslimit (uint)`: current block gaslimit
- `block.number (uint)`: current block number
- `block.timestamp (uint)`: current block timestamp as seconds since unix epoch
- `gasleft() returns (uint256)`: remaining gas
- `msg.data (bytes calldata)`: complete calldata
- `msg.sender (address payable)`: sender of the message (current call)
- `msg.sig (bytes4)`: first four bytes of the calldata (i.e. function identifier)
- `msg.value (uint)`: number of wei sent with the message
- `now (uint)`: current block timestamp (alias for block.timestamp)
- `tx.gasprice (uint)`: gas price of the transaction
- `tx.origin (address payable)`: sender of the transaction (full call chain)

#### Functions
