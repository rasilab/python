# base conda container
FROM continuumio/miniconda3:4.12.0

# for writing in Helvetica font
COPY Helvetica.tgz /tmp/Helvetica.tgz 
RUN tar -xvzf /tmp/Helvetica.tgz && \
    mkdir -p /usr/share/fonts/truetype/Helvetica && \
    mv Helvetica*.ttf /usr/share/fonts/truetype/Helvetica/

# Install mamba installer for quick conda installations
RUN conda install mamba -c conda-forge

# Install Jupyter in base environment 
RUN mamba install -y -c conda-forge jupyter 

# Install Python packages in base environment 
RUN mamba install -y -c conda-forge -c bioconda \
    pandas \
    matplotlib \
    biopython \
    pysam \
    plotnine \
    seaborn \
    regex \
    snakemake-minimal

RUN mamba install -y -c conda-forge altair
RUN pip install skimpy
