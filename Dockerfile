FROM python:3.14.0rc3-alpine3.22

# Install build dependencies for pip and widgets/plots
RUN apk add --no-cache \
    build-base \
    curl \
    linux-headers

# Set workdir
WORKDIR /app

# Copy application files
COPY . .

# Install requirements 
RUN pip install --no-cache-dir -r requirements.txt


# Expose Voila's default port
EXPOSE 8866

# Run Voila (no token, accessible externally)
# CMD ["voila", "--port=8866", "--no-browser", "--show_tracebacks=True", "--Voila.ip=0.0.0.0", "backingboarddesign.ipynb"]
#CMD ["voila", "--port=8866", "--no-browser", "--show_tracebacks=True", "--Voila.ip=0.0.0.0", "--MappingKernelManager.cull_interval=60", "--MappingKernelManager.cull_idle_timeout=120", "backingboarddesign.ipynb"]
CMD ["voila", "--port=8866", "--root-dir", ".", "--no-browser", "--show_tracebacks=True", "--Voila.ip=0.0.0.0", "--MappingKernelManager.cull_interval=60", "--MappingKernelManager.cull_idle_timeout=120", "backingboarddesign.ipynb"]
