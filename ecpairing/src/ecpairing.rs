// bn128 point addition copied from https://github.com/ethereumjs/rustbn.js

/*
extern "C" {
    fn callDataCopy(resultOffset: *const u8, dataOffset: u32, length: u32);
    fn storageStore(keyOffset: *const u32, valueOffset: *const u8);
}
*/

extern crate bn;

use std::io::{self, Read};

pub struct Error(pub &'static str);

impl From<&'static str> for Error {
    fn from(val: &'static str) -> Self {
	Error(val)
    }
}


#[no_mangle]
pub fn ec_pairing(input: [u8; 192]) -> [u8; 32] {
// input type: let input: [u8; 128] = [0;128];
//pub fn ec_pairing(input_hex_ptr: *const c_char) -> *const c_char {
	use bn::{Fq, Fq2, G1, G2, Gt, AffineG1, AffineG2, Group, pairing};

    /*
	let input_hex = unsafe { CStr::from_ptr(input_hex_ptr) };
	let input_str: &str = input_hex.to_str().unwrap();
	let input = FromHex::from_hex(input_str).unwrap();
	//println!("input: {:?}", input);
    */
    
    let zeros = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0];

	let elements = input.len() / 192;

    if input.len() % 192 != 0 {
        return zeros;
        // return bn::arith::U256::one();
        // return [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0];
	}

	let ret_val = if input.len() == 0 {
		bn::arith::U256::one()
	} else {
		let mut vals = Vec::new();
		
		for idx in 0..elements {
            let x_1;
            match Fq::from_slice(&input[idx*192..idx*192+32]) {
                Ok(fq) => { x_1 = fq },
                Err(_) => { return zeros }
            }

            let y_1;
            match Fq::from_slice(&input[idx*192+32..idx*192+64]) {
                Ok(fq) => { y_1 = fq },
                Err(_) => { return zeros }
            }

            let x2_i;
            match Fq::from_slice(&input[idx*192+64..idx*192+96]) {
                Ok(fq) => { x2_i = fq },
                Err(_) => { return zeros }
            }

            let x2_r;
            match Fq::from_slice(&input[idx*192+96..idx*192+128]) {
                Ok(fq) => { x2_r = fq },
                Err(_) => { return zeros }
            }

            let y2_i;
            match Fq::from_slice(&input[idx*192+128..idx*192+160]) {
                Ok(fq) => { y2_i = fq },
                Err(_) => { return zeros }
            }

            let y2_r;
            match Fq::from_slice(&input[idx*192+160..idx*192+192]) {
                Ok(fq) => { y2_r = fq },
                Err(_) => { return zeros }
            }

			//println!("creating g1_point with x1 and y1...");
			//println!("x1: {:?}  y1: {:?}", x_1, y_1);

			let g1_point;
			if x_1 == Fq::zero() && y_1 == Fq::zero() {
				g1_point = G1::zero();
			} else {
               match AffineG1::new(x_1, y_1) {
                   Ok(ap) => {
                       let g1_affine_point = ap;
                       g1_point = G1::from(g1_affine_point);
                   },
                   Err(_) => { return zeros }
               }
			}

			/*
			let mut g1_point_x_buf = [0u8; 32];
			let mut g1_point_y_buf = [0u8; 32];
			g1_point.x().to_big_endian(&mut g1_point_x_buf[0..32]);
			println!("g1_point.x(): {:?}", g1_point_x_buf.to_hex());
			g1_point.y().to_big_endian(&mut g1_point_y_buf[0..32]);
			println!("g1_point.y(): {:?}", g1_point_y_buf.to_hex());
			*/

			let fq2_x = Fq2::new(x2_r, x2_i);
		    let fq2_y = Fq2::new(y2_r, y2_i);
                    
			let g2_point;
			if x2_r.is_zero() && x2_i.is_zero() && y2_r.is_zero() && y2_i.is_zero() {
				g2_point = G2::zero();
			} else {
                match AffineG2::new(fq2_x, fq2_y) {
                    Ok (ap) => {
                        let g2_affine_point = ap;
                        g2_point = G2::from(g2_affine_point);
                    },
                    Err(_) => { return zeros }
                }
			}

			vals.push((g1_point, g2_point));
		};

        println!("all points valid. doing pairing computation...");
		let mul = vals.into_iter().fold(Gt::one(), |s, (a, b)| s * pairing(a, b));
		if mul == Gt::one() {
			bn::arith::U256::one()
		} else {
			bn::arith::U256::zero()
		}
	};

	let mut ec_pairing_output_buf = [0u8; 32];
	ret_val.to_big_endian(&mut ec_pairing_output_buf);
    return ec_pairing_output_buf;
	//let mut ec_pairing_output_str = ec_pairing_output_buf.to_hex();
	//println!("ec_pairing_output_str: {:?}", ec_pairing_output_str);

	//ec_pairing_output_str.push_str("\0");
	//return ec_pairing_output_str.as_ptr()
}



#[no_mangle]
pub fn main() {

    let input_pairing1: [u8; 192] = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
                                    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
                                    25, 142, 147, 147, 146, 13, 72, 58, 114, 96, 191, 183, 49, 251, 93, 37, 241, 170, 73, 51, 53, 169, 231, 18, 151, 228, 133, 183, 174, 243, 18, 194,
                                    24, 0, 222, 239, 18, 31, 30, 118, 66, 106, 0, 102, 94, 92, 68, 121, 103, 67, 34, 212, 247, 94, 218, 221, 70, 222, 189, 92, 217, 146, 246, 237,
                                    9, 6, 137, 208, 88, 95, 240, 117, 236, 158, 153, 173, 105, 12, 51, 149, 188, 75, 49, 51, 112, 179, 142, 243, 85, 172, 218, 220, 209, 34, 151, 91,
                                    18, 200, 94, 165, 219, 140, 109, 235, 74, 171, 113, 128, 141, 203, 64, 143, 227, 209, 231, 105, 12, 67, 211, 123, 76, 230, 204, 1, 102, 250, 125, 170];


    let input_pairing2: [u8; 192] = [28, 118, 71, 111, 77, 239, 75, 185, 69, 65, 213, 126, 187, 161, 25, 51, 129, 255, 167, 170, 118, 173, 166, 100, 221, 49, 193, 96, 36, 196, 63, 89,
                                    48, 52, 221, 41, 32, 246, 115, 226, 4, 254, 226, 129, 28, 103, 135, 69, 252, 129, 155, 85, 211, 233, 210, 148, 228, 92, 155, 3, 167, 106, 239, 65,
                                    25, 142, 147, 147, 146, 13, 72, 58, 114, 96, 191, 183, 49, 251, 93, 37, 241, 170, 73, 51, 53, 169, 231, 18, 151, 228, 133, 183, 174, 243, 18, 194,
                                    24, 0, 222, 239, 18, 31, 30, 118, 66, 106, 0, 102, 94, 92, 68, 121, 103, 67, 34, 212, 247, 94, 218, 221, 70, 222, 189, 92, 217, 146, 246, 237,
                                    9, 6, 137, 208, 88, 95, 240, 117, 236, 158, 153, 173, 105, 12, 51, 149, 188, 75, 49, 51, 112, 179, 142, 243, 85, 172, 218, 220, 209, 34, 151, 91,
                                    18, 200, 94, 165, 219, 140, 109, 235, 74, 171, 113, 128, 141, 203, 64, 143, 227, 209, 231, 105, 12, 67, 211, 123, 76, 230, 204, 1, 102, 250, 125, 170];


    let input_pairing3: [u8; 192] = [28, 118, 71, 111, 77, 239, 75, 185, 69, 65, 213, 126, 187, 161, 25, 51, 129, 255, 167, 170, 118, 173, 166, 100, 221, 49, 193, 96, 36, 196, 63, 89,
                                    48, 52, 221, 41, 32, 246, 115, 226, 4, 254, 226, 129, 28, 103, 135, 69, 252, 129, 155, 85, 211, 233, 210, 148, 228, 92, 155, 3, 167, 106, 239, 65,
                                    32, 157, 209, 94, 191, 245, 212, 108, 75, 216, 136, 229, 26, 147, 207, 153, 167, 50, 150, 54, 198, 53, 20, 57, 107, 74, 69, 32, 3, 163, 91, 247,
                                    4, 191, 17, 202, 1, 72, 59, 250, 139, 52, 180, 53, 97, 132, 141, 40, 144, 89, 96, 17, 76, 138, 192, 64, 73, 175, 75, 99, 21, 164, 22, 120,
                                    43, 184, 50, 74, 246, 207, 201, 53, 55, 162, 173, 26, 68, 92, 253, 12, 162, 167, 26, 205, 122, 196, 31, 173, 191, 147, 60, 42, 81, 190, 52, 77,
                                    18, 10, 42, 76, 243, 12, 27, 249, 132, 95, 32, 198, 254, 57, 224, 126, 162, 204, 230, 31, 12, 155, 176, 72, 22, 95, 229, 228, 222, 135, 117, 80];


    /*
    let mut padded_input = input_pairing1.chain(io::repeat(0));
    let mut padded_buf = [0u8; 192];
    padded_input.read_exact(&mut padded_buf[..]).expect("reading from zero-extended memory cannot fail; qed");
    */

    let pairing_result1 = ec_pairing(input_pairing1);
    println!("pairing_result1: {:?}", pairing_result1);
    
    let pairing_result2 = ec_pairing(input_pairing2);
    println!("pairing_result2: {:?}", pairing_result2);
    
    let pairing_result3 = ec_pairing(input_pairing3);
    println!("pairing_result3: {:?}", pairing_result3);

    /*
    let point1 = &padded_buf[0..64];
    let point2 = &padded_buf[64..192];

    let mut point1_padded = point1.chain(io::repeat(0));
    let mut point2_padded = point2.chain(io::repeat(0));
    */


}
