import os

def find_files():
    path = '/home/yass/CryptoBook/src/ransomware/test/'
    extensions = ['.doc','.data','.docx','.txt','.xlsx','.pptx','.mail','.mail']
    files = []
    # r=root, d=directories, f = files
    for r, d, f in os.walk(path):
        for file in f:
            for extension in extensions :
                if extension in file:
                    files.append(os.path.join(r, file))

    return files
