FROM continuumio/miniconda3

# Installs Jupyter
RUN [ "/opt/conda/bin/conda", "install", "jupyter", "-y", "--quiet" ]

RUN [ "mkdir", "/opt/notebooks" ]

RUN [ "mkdir", "-p", "/root/.local/share/jupyter/kernels/pyspark" ]

COPY kernels/kernel.json /root/.local/share/jupyter/kernels/pyspark/

EXPOSE 8888

ENTRYPOINT [ "/opt/conda/bin/jupyter", "notebook" ]

CMD [ "--notebook-dir=/opt/notebooks",	\
	"--ip='*'",											\
	"--port=8888",												\
	"--no-browser",												\
	"--allow-root" ]

