# makefile borrowed from https://github.com/killercup/wasm-experiments

WAT_ARGS ?= --fold-exprs --inline-exports --generate-names

/demo.rs:
	rustc +nightly --target wasm32-unknown-unknown -O --crate-type=cdylib sstore.rs
	mv sstore.wasm sstore-bloated.wasm
	wasm-gc sstore-bloated.wasm sstore.wasm

all: sstore.rs
	wasm2wat $(WAT_ARGS) sstore.wasm > sstore.wat
	wasm2wat $(WAT_ARGS) sstore-bloated.wasm > sstore-bloated.wat
