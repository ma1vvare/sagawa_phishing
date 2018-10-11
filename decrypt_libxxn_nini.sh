#!/bin/bash
#change .apk to .zip
#mv sagawa_1008.apk sagawa_1008.zip
unzip -p ./zip/sagawa_1011.zip lib/x86_64/libxxn.so > libxxn_1011.so

#grep AES key then save 
strings libxxn_1011.so | grep [A-Z][A-Z]*[0-9][0-9]*
key=$(strings libxxn_1011.so | grep [A-Z][A-Z]*[0-9][0-9]*)

#unzip nini.dll
unzip -p ./zip/sagawa_1011.zip assets/nini.dll > nini_1011.dll

#decode nini.dll by using AES key and generate nini.bin
python decode_nini.py $key
#change file type from .bin to .zip
mv decode_nini_1011.bin decode_nini_1011.zip
#extract classes.dex which inside .bin
unzip -p decode_nini_1011.zip classes.dex > classes_1011.dex

python decrypt_DES_ip.py
