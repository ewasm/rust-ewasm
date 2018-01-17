extern "C" {
    fn getCallDataSize() -> u32;
    fn storageStore(pathOffset: *const u32, valueOffset: *const u32);
}

#[no_mangle]
pub fn main() {
    let data_size : u32;
    
    unsafe {
        data_size = getCallDataSize();
    }
    
    let raw_data_size = &data_size as *const u32;
    let key: [u32;8] = [0;8];
    let raw_key = &key as *const u32;

    unsafe {
        storageStore(raw_key, raw_data_size);
    }
}
