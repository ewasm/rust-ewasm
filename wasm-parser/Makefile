WAT_ARGS ?= --fold-exprs --inline-exports --generate-names

SHELL := /bin/bash

all:
	cargo build --target=wasm32-unknown-unknown --release
	cp target/wasm32-unknown-unknown/release/ewasm_parser.wasm ewasm-parser-bloated.wasm
	wasm-gc ewasm-parser-bloated.wasm ewasm-parser.wasm
	wasm2wat $(WAT_ARGS) ewasm-parser.wasm > ewasm-parser.wat
	wasm2wat $(WAT_ARGS) ewasm-parser-bloated.wasm > ewasm-parser-bloated.wat
