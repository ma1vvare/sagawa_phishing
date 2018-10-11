import re
import os
import base64
import binascii
from subprocess import Popen, PIPE
from Crypto.Cipher import DES

data = os.popen("strings classes_1011.dex").read().splitlines()


#DES key is 'TEST', transfer to byte array and fill with 0
key = '5445535400000000'
key = bytearray.fromhex(key)
for line in data:
    # this regex can extract hash string
    if(re.findall(r"([a-f0-9\d]{32,64})$",line)):
        # which first character is not " "
        if line[0]=='@' or line[0]=='0' or line[0]==" ":
            line = line[1:]
        else:
            pass
        print "cipher : ",line, type(line)
        des = DES.new(key, DES.MODE_ECB)
        decrypt_data = des.decrypt(bytearray.fromhex(line))
        print decrypt_data
    else:
        pass
