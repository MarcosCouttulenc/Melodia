import os
import logging
import sys

# --- Configuración de Logging ---
logging.basicConfig(
    level=logging.INFO,
    handlers=[
        logging.FileHandler("app.log", encoding="utf-8"),
        logging.StreamHandler(sys.stdout),
    ],
    format='%(asctime)s - %(levelname)s - %(module)s:%(lineno)d - %(message)s'
)

logging.info("Hello, World!")
logging.info(f"Backend docker port: {os.environ.get('BACKEND_DOCKER_PORT', 'no port set')}")
logging.info(f"Backend exported port: {os.environ.get('BACKEND_EXPOSED_PORT', 'no port set')}")