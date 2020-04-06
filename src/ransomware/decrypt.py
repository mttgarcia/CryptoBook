from Crypto.Cipher import AES, PKCS1_OAEP
from Crypto.Random import get_random_bytes
from get_files import *
import sys
import os
from Crypto.PublicKey import RSA

def decrypt_all():
    try : 
        with open('test/key.txt','rb') as f:
            key = f.read()
    except :
        return 'No key found'

    files_crypted = find_files_encrypted()

    for filename in files_crypted :
        decrypt(filename,key)

    return 'decrypted'

def decrypt(filename,key):
    with open(filename,'rb') as file_in:
        nonce, tag, ciphertext = [ file_in.read(x) for x in (16, 16, -1) ]
    cipher = AES.new(key, AES.MODE_EAX, nonce)
    os.remove(filename)
    with open(os.path.splitext(filename)[0],'wb') as f:
        f.write(cipher.decrypt_and_verify(ciphertext, tag))

decrypt_all()
