import os
import logging
import sys
from flask import Flask

# --- Configuración de Logging ---
logging.basicConfig(
    level=logging.INFO,
    handlers=[
        logging.FileHandler("app.log", encoding="utf-8"),
        logging.StreamHandler(sys.stdout),
    ],
    format='%(asctime)s - %(levelname)s - %(module)s:%(lineno)d - %(message)s'
)

app = Flask(__name__)

@app.route("/")
def hello_world():
    logging.info("Hello World endpoint was called")
    return "Hello, World!"

if __name__ == "__main__":
    port = int(os.getenv("BACKEND_DOCKER_PORT", 5000))
    host = os.getenv("BACKEND_HOST", "0.0.0.0")
    app.run(host=host, port=port)

