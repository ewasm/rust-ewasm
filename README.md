# rust-ewasm
Examples of compiling Rust code to ewasm contracts

These were compiled with rustc 1.25.0-nightly, and a [patched wasm-gc](https://github.com/ewasm/wasm-gc/pull/1).

```
$ rustup run nightly rustc --version
rustc 1.25.0-nightly (79a521bb9 2018-01-15)

$ rustup target add wasm32-unknown-unknown --toolchain nightly

$ cargo install --git https://github.com/ewasm/wasm-gc --branch keep-main-func
```

You also need [wabt](https://github.com/WebAssembly/wabt) for `wasm2wat`.
