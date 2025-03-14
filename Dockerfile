# Start from a base image with python 3.11 preinstalled
FROM buildpack-deps:bookworm

RUN apt update
RUN apt install -y git libgl1 libglib2.0-0 python3-pip python3-venv
RUN git clone https://github.com/derrian-distro/LoRA_Easy_Training_scripts_Backend
COPY entrypoint.sh /entrypoint.sh
WORKDIR /LoRA_Easy_Training_scripts_Backend
RUN python3 installer.py colab

EXPOSE 8000
ENTRYPOINT ["/entrypoint.sh"]
