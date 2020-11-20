FROM continuumio/miniconda3

# User setup
RUN useradd -ms /bin/bash analyst

WORKDIR /home/analyst

RUN [ "chown", "-R", "analyst:analyst", "/opt" ]

USER analyst

# Installs Jupyter
RUN [ "/opt/conda/bin/conda", "install", "jupyter", "-y", "--quiet" ]

RUN [ "mkdir", "/opt/notebooks" ]

RUN [ "mkdir", "-p", "/home/analyst/.local/share/jupyter/kernels/pyspark" ]

RUN [ "mkdir", "-p", "/home/analyst/.ipython/profile_pyspark/startup" ]

COPY config/pyspark/setup.py /home/analyst/.ipython/profile_pyspark/startup/00-pyspark-setup.py

COPY kernels/kernel.json /home/analyst/.local/share/jupyter/kernels/pyspark

EXPOSE 8888

ENTRYPOINT [ "/opt/conda/bin/jupyter", "notebook" ]

CMD [ "--notebook-dir=/opt/notebooks", \
	"--ip='*'",                          \
	"--port=8888",                       \
	"--no-browser",                      \
	"--allow-root" ]

