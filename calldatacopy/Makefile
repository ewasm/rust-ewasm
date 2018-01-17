# makefile borrowed from https://github.com/killercup/wasm-experiments

WAT_ARGS ?= --fold-exprs --inline-exports --generate-names

/calldatacopy.rs:
	rustc +nightly --target wasm32-unknown-unknown -O --crate-type=cdylib calldatacopy.rs
	mv calldatacopy.wasm calldatacopy-bloated.wasm
	wasm-gc calldatacopy-bloated.wasm calldatacopy.wasm

all: calldatacopy.rs
	wasm2wat $(WAT_ARGS) calldatacopy.wasm > calldatacopy.wat
	wasm2wat $(WAT_ARGS) calldatacopy-bloated.wasm > calldatacopy-bloated.wat
