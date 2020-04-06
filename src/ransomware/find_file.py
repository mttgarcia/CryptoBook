import os

path = '/'
extensions = ['.doc','.data','.docx','.txt','.xlsx','.pptx','.mail','.mail']
files = []
# r=root, d=directories, f = files
for r, d, f in os.walk(path):
    for file in f:
        for extension in extensions :
            if extension in file:
                files.append(os.path.join(r, file))

for f in files:
    print(f)
