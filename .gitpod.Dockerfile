FROM baneeishaque/gitpod-workspace-full-vnc-1366x768-tint2-pcmanfm-zsh-android-studio-gh-chrome-intellij-idea-pycharm

ENV GIT_INTERNAL_GETTEXT_TEST_FALLBACKS=1

RUN pyenv install anaconda3-2020.11 \
 && pyenv global anaconda3-2020.11

RUN bash -c "conda init bash"

RUN zsh -c "conda init zsh"

RUN conda config --add channels conda-forge
RUN conda config --add channels pytorch

RUN conda update -y --all
