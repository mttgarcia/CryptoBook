from Crypto.PublicKey import RSA


def create_keys():
    key = RSA.generate(2048)
    public_key = key.publickey()
    k = key.exportKey('PEM')
    p = key.publickey().exportKey('PEM')
    with open('keys/private.pem','w') as kf:
            kf.write(k.decode())
            kf.close()

    with open('keys/public.pem','w') as pf:
            pf.write(p.decode())
            pf.close()

    return 0 

create_keys()
