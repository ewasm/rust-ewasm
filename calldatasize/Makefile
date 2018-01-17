# makefile borrowed from https://github.com/killercup/wasm-experiments

WAT_ARGS ?= --fold-exprs --inline-exports --generate-names

/calldatasize.rs:
	rustc +nightly --target wasm32-unknown-unknown -O --crate-type=cdylib calldatasize.rs
	mv calldatasize.wasm calldatasize-bloated.wasm
	wasm-gc calldatasize-bloated.wasm calldatasize.wasm

all: calldatasize.rs
	wasm2wat $(WAT_ARGS) calldatasize.wasm > calldatasize.wat
	wasm2wat $(WAT_ARGS) calldatasize-bloated.wasm > calldatasize-bloated.wat
