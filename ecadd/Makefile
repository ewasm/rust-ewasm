WAT_ARGS ?= --fold-exprs --inline-exports --generate-names

SHELL := /bin/bash

all:
	cargo build --target=wasm32-unknown-unknown --release
	cp target/wasm32-unknown-unknown/release/ewasm_ecadd.wasm ecadd-bloated.wasm
	wasm-gc ecadd-bloated.wasm ecadd.wasm
	wasm2wat $(WAT_ARGS) ecadd.wasm > ecadd.wat
	wasm2wat $(WAT_ARGS) ecadd-bloated.wasm > ecadd-bloated.wat
