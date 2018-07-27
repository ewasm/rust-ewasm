WAT_ARGS ?= --fold-exprs --inline-exports --generate-names

/ewasm_token.rs:
	rustc +nightly --target wasm32-unknown-unknown -O --crate-type=cdylib ewasm_token.rs
	mv ewasm_token.wasm ewasm_token-bloated.wasm
	wasm-gc ewasm_token-bloated.wasm ewasm_token.wasm

all: ewasm_token.rs
	wasm2wat $(WAT_ARGS) ewasm_token.wasm > ewasm_token.wat
	wasm2wat $(WAT_ARGS) ewasm_token-bloated.wasm > ewasm_token-bloated.wat
