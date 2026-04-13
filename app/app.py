import os
from flask import Flask

app = Flask(__name__)

def get_message():

    try:
        with open("/mnt/secrets/APP-MESSAGE", "r") as f:
            return f.read().strip()
    except Exception:
        pass
    env_message = os.getenv("APP_MESSAGE")
    if env_message:
        return env_message
    return "Default Message"

@app.route("/")
def home():
    return get_message()

if __name__ == "__main__":
    app.run(host="0.0.0.0", port=5000)
