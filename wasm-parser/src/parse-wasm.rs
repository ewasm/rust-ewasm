extern "C" {
    fn getCallDataSize() -> u32;
    fn callDataCopy(resultOffset: *const u8, dataOffset: u32, length: u32);
    fn storageStore(keyOffset: *const u32, valueOffset: *const u32);
}

extern crate parity_wasm;

use parity_wasm::elements::Module;
use parity_wasm::elements;

#[no_mangle]
pub fn main() {

    let calldata_size : u32;
    unsafe {
        calldata_size = getCallDataSize();
    }

    let mut datacopy_result = vec![0; calldata_size as usize];
    let raw_datacopy_result_offset = datacopy_result.as_mut_ptr();
    let calldata_offset: u32 = 0;

    unsafe {
        callDataCopy(raw_datacopy_result_offset, calldata_offset, calldata_size);
    }

    let mut module: Module = parity_wasm::deserialize_buffer(&datacopy_result).unwrap();

    let mut func_body_count: u32 = 0;
    for section in module.sections_mut() {
        match section {
            &mut elements::Section::Code(ref mut code_section) => {
                //for ref mut func_body in code_section.bodies_mut() {
                for _ in code_section.bodies_mut() {
                    func_body_count = func_body_count + 1;
                    //inject_nop(func_body.code_mut());
                }
            },
            _ => { }
        }
    }

    let sstore_key: [u32;8] = [0;8];
    let raw_sstore_key = &sstore_key as *const u32;
    let raw_sstore_value = &func_body_count as *const u32;

    unsafe {
       storageStore(raw_sstore_key, raw_sstore_value);
    }
}
