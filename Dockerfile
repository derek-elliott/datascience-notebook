FROM derekelliott/datascience-notebook:latest

RUN conda update --quiet --yes jupyterlab \
    && pip install jupyter-tensorboard

RUN jupyter labextension install @jupyterlab/geojson-extension \
    && jupyter labextension install @jupyterlab/fasta-extension

RUN jupyter labextension install @jupyterlab/vega3-extension

RUN jupyter labextension install @jupyter-widgets/jupyterlab-manager \
    && jupyter labextension install @jupyterlab/latex

RUN jupyter labextension install jupyterlab_tensorboard

RUN pip install jupyterlab_latex

RUN conda install --quiet --yes tensorflow-gpu \
    keras \
    pytorch \
    torchvision \
    -c pytorch \
    && conda clean -tipsy \
    && fix-permissions $CONDA_DIR \
    && fix-permissions /home/$NB_USER
