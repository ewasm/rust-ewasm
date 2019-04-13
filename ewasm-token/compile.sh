#!/bin/bash


EWASM_NAME=ewasm_token
TNAME=wrc20ChallengeFiller.yml

make

./binary2hex $EWASM_NAME.wasm > $EWASM_NAME.hex

cat header.txt > $TNAME
echo "      code: '0x$(cat $EWASM_NAME.hex)'" >> $TNAME
cat footer.txt >> $TNAME

