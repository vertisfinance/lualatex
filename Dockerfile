#
# docker run -it --rm=true \
#         -e USER=$USER -e USERID=$UID \        # bind user for file permissions
#        -v $HOME:/data \
#        --name lualatex jgiovaresco/lualatex
#

FROM vertisfinance/baseimage

RUN sed -i 's/main/main contrib non-free/g' /etc/apt/sources.list

RUN apt-get update && apt-get install -y --no-install-recommends \
    texlive \
    texlive-generic-recommended \
    texlive-latex-recommended \
    texlive-fonts-recommended \
    texlive-extra-utils \
    texlive-font-utils \
    texlive-xetex \
    texlive-luatex \
    fonts-lmodern \
    fonts-font-awesome \
    && rm -rf /var/lib/apt/lists/*

COPY entry.py /entry.py
