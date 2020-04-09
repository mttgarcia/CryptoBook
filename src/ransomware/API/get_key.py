from flask import Flask,request

app = Flask(__name__)

@app.route('/', methods=['POST'])
def get_key():
    if request.method == 'POST':
        data = request.get_data().decode()
        with open('key.aes','w') as f:
            f.write(data)
    return 'ok'

if __name__ == "__main__" :
    app.run(host = '0.0.0.0', port = 8080)
