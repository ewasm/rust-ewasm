WAT_ARGS ?= --fold-exprs --inline-exports --generate-names

SHELL := /bin/bash

all:
	cargo build --target=wasm32-unknown-unknown --release
	cp target/wasm32-unknown-unknown/release/ewasm_ecpairing.wasm ecpairing-bloated.wasm
	wasm-gc ecpairing-bloated.wasm ecpairing.wasm
	wasm2wat $(WAT_ARGS) ecpairing.wasm > ecpairing.wat
	wasm2wat $(WAT_ARGS) ecpairing-bloated.wasm > ecpairing-bloated.wat
