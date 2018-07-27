var fs = require('fs');

var bin = fs.readFileSync('./ewasm_token_env_ethereum.wasm');

console.log('binary as hex:')
console.log(bin.toString('hex'))
