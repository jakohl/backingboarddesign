FROM python:3.14.0rc3-alpine3.22

RUN apk add --no-cache \
    build-base \
    curl \
    linux-headers

WORKDIR /app

RUN pip install --no-cache-dir voila jupyterlab numpy ipywidgets ipython

COPY . .

EXPOSE 8866

CMD ["voila", "backingboarddesign.ipynb", \
     "--port=8866", \
     "--no-browser", \
     "--show_tracebacks=True", \
     "--Voila.ip=0.0.0.0", \
     "--VoilaConfiguration.file_allowlist=.*\\.(png|jpg|gif|svg|pdf)", \
     "--MappingKernelManager.cull_interval=60", \
     "--MappingKernelManager.cull_idle_timeout=120"]

 
