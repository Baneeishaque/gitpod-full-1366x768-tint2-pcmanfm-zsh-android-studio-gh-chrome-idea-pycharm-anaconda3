FROM baneeishaque/gitpod-workspace-full-vnc-1366x768-tint2-pcmanfm-zsh-android-studio-gh-chrome-intellij-idea-pycharm

ENV GIT_INTERNAL_GETTEXT_TEST_FALLBACKS=1

ARG anaconda3Version="2021.11"

RUN pyenv update \
 && pyenv install anaconda3-${anaconda3Version}\
 && pyenv global anaconda3-${anaconda3Version}

RUN ls /home/gitpod/.pyenv/versions/anaconda3-${anaconda3Version}/envs

RUN sudo mkdir -p /workspace/.conda \
 && sudo chown -R gitpod /workspace/.conda \
 && mv /home/gitpod/.pyenv/versions/anaconda3-${anaconda3Version}/envs /workspace/.conda/ \
 && ln -s /workspace/.conda/envs /home/gitpod/.pyenv/versions/anaconda3-${anaconda3Version}/envs

# disable init of conda env. "base"
# RUN conda config --set auto_activate_base false

# RUN conda config --add pkgs_dirs /workspace/.conda/pkgs
# RUN conda config --add envs_dirs /workspace/.conda/envs

RUN conda config --set show_channel_urls True

RUN bash -c "conda init bash"
RUN zsh -c "conda init zsh"

RUN conda update -y --all
