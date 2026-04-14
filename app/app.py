import os
import base64
import logging
from flask import Flask

app = Flask(__name__)
logging.basicConfig(level=logging.INFO)

def decode_message(encoded_message: str) -> str:
    try:
        return base64.b64decode(encoded_message).decode("utf-8")
    except Exception as e:
        logging.warning(f"Failed to decode message: {e}")
        return "Invalid Encoded Message"

def get_message():
    # 1. Try reading encoded message from Key Vault mounted file
    try:
        with open("/mnt/secrets/APP-MESSAGE", "r") as f:
            encoded_message = f.read().strip()
            logging.info("Encoded message fetched from Key Vault file")
            return decode_message(encoded_message)
    except Exception as e:
        logging.warning(f"Key Vault file read failed: {e}")

    # 2. Fallback to environment variable
    env_message = os.getenv("APP_MESSAGE")
    if env_message:
        logging.info("Encoded message fetched from environment variable")
        return decode_message(env_message)

    # 3. Default fallback
    logging.info("Using default fallback message")
    return "Default Message"

@app.route("/")
def home():
    logging.info("Received request on / endpoint")
    return get_message()

if __name__ == "__main__":
    app.run(host="0.0.0.0", port=5000)
