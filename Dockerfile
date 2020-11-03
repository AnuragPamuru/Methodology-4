ARG BASE_CONTAINER=ucsdets/datascience-notebook:2020.2-stable

FROM $BASE_CONTAINER

USER root

RUN	apt-get install aria2
RUN	apt-get install nmap
RUN	apt-get install traceroute

RUN conda install --yes geopandas

RUN pip install --no-cache-dir babypandas

COPY /run_jupyter.sh /
USER $NB_UID

# Override command to disable running jupyter notebook at launch
CMD ["/bin/bash"]
