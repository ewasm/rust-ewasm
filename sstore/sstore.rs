// an ewasm test case, originally written in wasm, ported to Rust

extern "C" {
    fn getAddress(offset: *const u32);
    fn storageStore(keyOffset: *const u32, valueOffset: *const u32);
}

#[no_mangle]
pub fn main() {
    //  32,32,32,32,32,32,32,32 = 256
    // [0, 0, 0, 0, 0, 0, 0, 0] fill 256 bits of memory with zeros

    let address : [u32;8] = [0;8];
    let raw_address = &address as *const u32;

    let sstore_key: [u32;8] = [0;8];
    let raw_sstore_key = &sstore_key as *const u32;

    unsafe {
       getAddress(raw_address);
       storageStore(raw_sstore_key, raw_address);
    }
    return;
}
