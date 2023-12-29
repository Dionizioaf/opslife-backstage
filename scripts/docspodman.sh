podman build . -t mkdocs:local-dev
podman run -w /content -v $(pwd)/mock-docs:/content -p 8000:8000 -it mkdocs:local-dev serve -a 0.0.0.0:8000