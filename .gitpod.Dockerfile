FROM baneeishaque/gitpod-workspace-full-vnc-1366x768-tint2-pcmanfm-zsh-android-studio-gh-chrome-intellij-idea-pycharm

ENV GIT_INTERNAL_GETTEXT_TEST_FALLBACKS=1

RUN pyenv install anaconda3-2020.11 \
 && pyenv global anaconda3-2020.11

RUN bash -c "conda init bash"
RUN zsh -c "conda init zsh"

RUN conda config --add pkgs_dirs /workspace/.conda/pkgs
RUN conda config --add envs_dirs /workspace/.conda/envs

RUN conda config --set show_channel_urls True

# RUN conda config --add channels conda-forge
# RUN conda config --add channels pytorch
# RUN conda config --add channels intel

# RUN conda config --set channel_priority strict

RUN sudo mkdir -p /workspace/.conda \
 && sudo chown -R gitpod /workspace/.conda \
 && conda update -y --all
