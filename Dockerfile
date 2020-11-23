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

# Installs sparkmagic
RUN [ "pip", "install", "sparkmagic" ]

# Configure wrapper kernels
RUN jupyter-kernelspec install --user `pip show sparkmagic | grep -i "Location" | cut -d' ' -f2`/sparkmagic/kernels/sparkkernel

RUN jupyter-kernelspec install --user `pip show sparkmagic | grep -i "Location" | cut -d' ' -f2`/sparkmagic/kernels/pysparkkernel

RUN jupyter-kernelspec install --user `pip show sparkmagic | grep -i "Location" | cut -d' ' -f2`/sparkmagic/kernels/sparkrkernel

RUN jupyter serverextension enable --py sparkmagic

USER analyst

# Add sparkmagic configuration
RUN [ "mkdir", "/home/analyst/.sparkmagic" ]

COPY config/config.json /home/analyst/.sparkmagic

WORKDIR /home/analyst

EXPOSE 8888

ENTRYPOINT [ "/opt/conda/bin/jupyter", "notebook" ]

CMD [ "--notebook-dir=/opt/notebooks", \
	"--ip='*'",                          \
	"--port=8888",                       \
	"--no-browser",                      \
	"--allow-root" ]

