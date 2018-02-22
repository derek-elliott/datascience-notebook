FROM saywhat1/datascience-notebook:latest

RUN conda update jupyterlab \
    && jupyter labextension install @jupyterlab/geojson-extension \
    && jupyter labextension install @jupyterlab/fasta-extension \
    && jupyter labextension install @jupyterlab/plotly-extension \
    && jupyter labextension install @jupyterlab/vega3-extension \
    && jupyter labextension install @jupyter-widgets/jupyterlab-manager \
    && conda install --quiet --yes tensorflow=1.3* keras=2.0* pytorch torchvision -c pytorch \
    && conda clean -tipsy \
    && fix-permissions $CONDA_DIR \
    && fix-permissions /home/$NB_USER
