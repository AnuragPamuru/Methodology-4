ARG BASE_CONTAINER=ucsdets/datascience-notebook:2020.2-stable

FROM $BASE_CONTAINER

USER root

RUN conda install pytorch torchvision torchaudio cudatoolkit=10.2 --yes -c pytorch

COPY /run_jupyter.sh /
RUN chmod 755 /run_jupyter.sh
USER $NB_UID

# Override command to disable running jupyter notebook at launch
CMD ["/bin/bash"]
