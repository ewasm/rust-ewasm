// see ewasm "WRC20" pseudocode https://gist.github.com/axic/16158c5c88fbc7b1d09dfa8c658bc363
extern crate ewasm_api;
use ewasm_api::types::*;

#[no_mangle]
pub fn main() {
    // 0x9993021a do_balance() ABI signature
    let do_balance_signature: [u8; 4] = [153, 147, 2, 26];

    // 0x5d359fbd do_transfer() ABI signature
    let do_transfer_signature: [u8; 4] = [93, 53, 159, 189];
    

    let data_size = ewasm_api::calldata_size();
    let input_data = ewasm_api::calldata_acquire();

    if data_size < 4 {
        ewasm_api::revert();
    }
    
    let function_selector = input_data[0..4].to_vec();

    if function_selector == do_balance_signature {

        if data_size != 24 {
            ewasm_api::revert();
        }

        let address_data = input_data[4..].to_vec();
        let mut address = Address::default();
        address.bytes.copy_from_slice(&address_data[0..20]);

        let _test = ewasm_api::caller();
        let mut storage_key = StorageKey::default();

        storage_key.bytes[12..].copy_from_slice(&address.bytes[0..20]);
            
        let balance = ewasm_api::storage_load(&storage_key);

        // checks the balance is not 0
        if balance.bytes != StorageValue::default().bytes {
            ewasm_api::finish_data(&balance.bytes);
        }
    }


    if function_selector == do_transfer_signature {
        if input_data.len() != 32 {
            ewasm_api::revert();
        }

        // Get Sender
        let sender = ewasm_api::caller();
        let mut sender_key = StorageKey::default();

        sender_key.bytes[12..].copy_from_slice(&sender.bytes[0..20]);


        // Get Recipient
        let recipient_data = input_data[4..24].to_vec();
        let mut recipient_key = StorageKey::default();

        recipient_key.bytes[12..].copy_from_slice(&recipient_data[..]);

        // Get Value
        let value_data = input_data[24..].to_vec();
        let mut value = StorageValue::default();
        let value_len = value_data.len();
        let start = 32 - value_len;

        for i in start..(value_len+start) {
            value.bytes[i] = value_data[i-start];
        }


        // Get Sender Balance
        let sender_balance = ewasm_api::storage_load(&sender_key);

        // Get Recipient Balance
        let recipient_balance = ewasm_api::storage_load(&recipient_key);

        // Substract sender balance
        let sb_u256 = bigint::uint::U256::from_big_endian(&sender_balance.bytes[0..32]);
        let val_u256 = bigint::uint::U256::from_big_endian(&value.bytes[0..32]);

        let new_sb_u256 = sb_u256 - val_u256;

        let mut sb_value = StorageValue::default();
        let mut new_sb_bytes: [u8;32] = Default::default();
        new_sb_u256.to_big_endian(&mut new_sb_bytes);

        sb_value.bytes.copy_from_slice(&new_sb_bytes[0..32]);

        // Adds recipient balance
        let rc_u256 = bigint::uint::U256::from_big_endian(&recipient_balance.bytes[0..32]);

        let new_rc_u256 = rc_u256 + val_u256;
        
        let mut rc_value = StorageValue::default();
        let mut new_rc_bytes: [u8; 32] = Default::default();
        new_rc_u256.to_big_endian(&mut new_rc_bytes);
        
        rc_value.bytes.copy_from_slice(&new_rc_bytes[0..32]);

        ewasm_api::storage_store(&sender_key, &sb_value); 
        ewasm_api::storage_store(&recipient_key, &rc_value); 

    } 
    return;
}
