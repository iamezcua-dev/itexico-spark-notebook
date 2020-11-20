FROM continuumio/miniconda3

# Library setup
RUN apt-get update && apt-get install -y build-essential libkrb5-dev

# User setup
RUN useradd -ms /bin/bash analyst

RUN [ "chown", "-R", "analyst:analyst", "/opt" ]

USER analyst

# Installs Jupyter
RUN [ "/opt/conda/bin/conda", "install", "jupyter", "-y", "--quiet" ]

RUN [ "mkdir", "/opt/notebooks" ]

RUN [ "pip", "install", "sparkmagic" ]

USER root

WORKDIR /opt/conda/lib/python3.7/site-packages

RUN jupyter-kernelspec install sparkmagic/kernels/sparkkernel

RUN jupyter-kernelspec install sparkmagic/kernels/pysparkkernel

RUN jupyter-kernelspec install sparkmagic/kernels/sparkrkernel

USER analyst

WORKDIR /home/analyst

EXPOSE 8888

ENTRYPOINT [ "/opt/conda/bin/jupyter", "notebook" ]

CMD [ "--notebook-dir=/opt/notebooks", \
	"--ip='*'",                          \
	"--port=8888",                       \
	"--no-browser",                      \
	"--allow-root" ]

