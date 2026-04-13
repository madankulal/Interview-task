import os
import logging
from flask import Flask

app = Flask(__name__)

# Configure logging
logging.basicConfig(level=logging.INFO)

def get_message():
    try:
        with open("/mnt/secrets/APP-MESSAGE", "r") as f:
            message = f.read().strip()
            logging.info("Message fetched from Key Vault")
            return message
    except Exception as e:
        logging.warning(f"Key Vault read failed: {e}")

    env_message = os.getenv("APP_MESSAGE")
    if env_message:
        logging.info("Message fetched from environment variable")
        return env_message

    logging.info("Using default message")
    return "Default Message"

@app.route("/")
def home():
    logging.info("Received request on / endpoint")
    return get_message()

if __name__ == "__main__":
    app.run(host="0.0.0.0", port=5000)
