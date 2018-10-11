from Crypto.Cipher import AES
import base64
import sys


p_key=sys.argv[1]
print str(p_key)
f = open("nini_1011.dll","rb")
endata = f.read()
f.close()
key = base64.b64decode(str(p_key))
cryptor = AES.new(key, AES.MODE_ECB)
dedata = cryptor.decrypt(endata)
with open("decode_nini_1011.bin", 'w') as fo:
    fo.write(dedata)
fo.close()
