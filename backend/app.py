import os

print("Hello, World!")
print(f"Backend docker port: {os.environ.get('BACKEND_DOCKER_PORT', 'no port set')}")
print(f"Backend exported port: {os.environ.get('BACKEND_EXPOSED_PORT', 'no port set')}")