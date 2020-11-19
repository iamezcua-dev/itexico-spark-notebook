FROM continuumio/miniconda3

# Installs Jupyter
RUN [ "/opt/conda/bin/conda", "install", "jupyter", "-y", "--quiet" ]

RUN [ "mkdir", "/opt/notebooks" ]

EXPOSE 8888

ENTRYPOINT [ "/opt/conda/bin/jupyter", "notebook" ]

CMD [ "--notebook-dir=/opt/notebooks",	\
	"--ip='*'",											\
	"--port=8888",												\
	"--no-browser",												\
	"--allow-root" ]

RUN [ "mkdir", "-p", "/root/.local/share/jupyter/kernels" ]

COPY kernels/kernel.json /root/.local/share/jupyter/kernels
