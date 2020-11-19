FROM continuumio/miniconda3

EXPOSE 8888

RUN [ "mkdir", "-p", "/opt/notebooks" ]

RUN [ "mkdir", "-p", "/root/.local/share/jupyter/runtime" ]

RUN [ "/opt/conda/bin/conda", "install", "jupyter", "-y", "--quiet" ]

ENTRYPOINT [ "/opt/conda/bin/jupyter", "notebook" ]

CMD [ "--notebook-dir=/opt/notebooks",	\
	"--ip='0.0.0.0'",											\
	"--port=8888",												\
	"--no-browser",												\
	"--allow-root" ]

