import os
from flask import Flask

app = Flask(__name__)

@app.route("/")
def home():
    return os.getenv("APP_MESSAGE", "Default Message")

app.run(host="0.0.0.0", port=5000)
