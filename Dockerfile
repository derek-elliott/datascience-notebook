FROM saywhat1/datascience-notebook:latest

RUN conda update --quiet --yes jupyterlab \
    && jupyter labextension install @jupyterlab/geojson-extension \
    && jupyter labextension install @jupyterlab/fasta-extension \
    && jupyter labextension install @jupyterlab/plotly-extension \
    && jupyter labextension install @jupyterlab/vega3-extension \
    && jupyter labextension install @jupyter-widgets/jupyterlab-manager \
    && jupyter labextension install @jupyterlab/latex \
    # && jupyter labextension install jupyterlab_voyager \
    && jupyter labextension install jupyterlab-toc \
    && jupyter labextension install @mflevine/jupyterlab_html \
    && jupyter labextension install @ijmbarr/jupyterlab_spellchecker \
    && jupyter labextension install jupyterlab-scales \
    && jupyter labextension install jupyterlab-drawio

RUN pip install jupyterlab_latex

RUN conda install --quiet --yes tensorflow-gpu=1.3* \
    keras=2.0* \
    pytorch \
    torchvision \
    -c pytorch \
    && conda clean -tipsy \
    && fix-permissions $CONDA_DIR \
    && fix-permissions /home/$NB_USER
