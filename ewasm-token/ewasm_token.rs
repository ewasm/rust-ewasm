// see ewasm "WRC20" pseudocode https://gist.github.com/axic/16158c5c88fbc7b1d09dfa8c658bc363

extern "C" {
    fn getCallDataSize() -> u32;
    fn callDataCopy(resultOffset: *const u8, dataOffset: u32, length: u32);
    fn storageStore(keyOffset: *const u32, valueOffset: *const u8);
    //fn getAddress(offset: *const u32);
    fn getCaller(offset: *const u32);
    fn revert(dataOffset: *const u32, length: u32);
}

#[no_mangle]
pub fn main() {

    // 0x9993021a do_balance() ABI signature
    let do_balance_signature: [u8; 4] = [153, 147, 2, 26];

    // 0x5d359fbd do_transfer() ABI signature
    let do_transfer_signature: [u8; 4] = [93, 53, 159, 189];

    let data_size : u32;
    unsafe {
        data_size = getCallDataSize();
    }

    if data_size < 4 {
        let revert_data_offset: [u32;1] = [0;1];
        let revert_data_offset_ptr = &revert_data_offset as *const u32;
        unsafe {
            revert(revert_data_offset_ptr, 0);
        }
    }

    let calldata_function_selector: [u8;4] = [0;4];
    let calldata_function_selector_offset: u32 = 0;
    let calldata_function_selector_length: u32 = 4;

    let raw_calldata_function_selector = &calldata_function_selector as *const u8;

    unsafe {
        callDataCopy(raw_calldata_function_selector, calldata_function_selector_offset, calldata_function_selector_length);
    }

    //let address : [u8;8] = [0;8];
    //let raw_address = &address as *const u8;

    let sstore_key: [u32;8] = [0;8];
    let raw_sstore_key = &sstore_key as *const u32;

    let transfer_test_bytes: [u8; 8] = [1, 1, 1, 1, 2, 2, 2, 2];
    let raw_transfer_test_bytes = &transfer_test_bytes as *const u8;

    if calldata_function_selector == do_transfer_signature {
        // write to sstore for quick test
        unsafe {
            storageStore(raw_sstore_key, raw_transfer_test_bytes);
        }
    }

    let balance_test_bytes: [u8; 8] = [8, 8, 8, 8, 9, 9, 9, 9];
    let raw_balance_test_bytes = &balance_test_bytes as *const u8;

    if calldata_function_selector == do_balance_signature {
        // write to sstore for quick test
        unsafe {
            storageStore(raw_sstore_key, raw_balance_test_bytes);
        }
    }


    /*
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
    */

    return;
}
