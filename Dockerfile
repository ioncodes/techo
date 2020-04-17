FROM ubuntu:18.04
RUN apt-get update -y
RUN apt-get install -y python3 python3-pip nodejs npm curl cmake
RUN curl -sf -L https://static.rust-lang.org/rustup.sh | sh -s -- -y
RUN pip3 install notebook
RUN pip3 install jupyterthemes
RUN pip3 install pymatbridge
RUN pip3 install matlab_kernel
RUN pip3 install bash_kernel
RUN pip3 install emu86
RUN pip3 install powershell_kernel
RUN pip3 install ilua
RUN pip3 install jupyter-c-kernel
RUN python3 -m bash_kernel.install
RUN python3 -m kernels.intel.install
RUN python3 -m powershell_kernel.install
RUN install_c_kernel
RUN npm install -g ijavascript
RUN ijsinstall
RUN /root/.cargo/bin/cargo install evcxr_jupyter
RUN /root/.cargo/bin/evcxr_jupyter --install
ADD ./run.sh /run.sh
WORKDIR /notebooks
EXPOSE 8844
ENTRYPOINT [ "/run.sh" ]