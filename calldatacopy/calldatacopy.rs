
extern "C" {
    fn callDataCopy(resultOffset: *const u32, dataOffset: u32, length: u32);
    fn storageStore(keyOffset: *const u32, valueOffset: *const u32);
}

#[no_mangle]
pub fn main() {
    let result_offset: [u32;8] = [0;8];
    let data_offset:   u32     = 0;
    let data_length:   u32     = 2;
    let storage_key:   [u32;8] = [0;8];

    let raw_result_offset = &result_offset as *const u32;
    let raw_storage_key = &storage_key as *const u32;

    unsafe {
        callDataCopy(raw_result_offset, data_offset, data_length);
        storageStore(raw_storage_key, raw_result_offset);
    }
    
    return;
}
