import os
import requests

# Leer host y puerto desde las mismas variables que usa el backend
backend_host = os.getenv("BACKEND_TEST_HOST", "backend")
backend_port = os.getenv("BACKEND_DOCKER_PORT", "8080")

# Construir la URL para los tests
BASE_URL = f"http://{backend_host}:{backend_port}"

def test_hello_endpoint():
    # Endpoint raíz "/"
    response = requests.get(f"{BASE_URL}/")
    assert response.status_code == 200
    assert response.text == "Hello, World!"
