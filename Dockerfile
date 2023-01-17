FROM ubuntu:20.04
SHELL [ "/bin/sh", "-c" ]

RUN apt-get update
RUN apt update

WORKDIR /app

RUN apt install -y python3-pip
RUN pip install --upgrade pip

ADD domain.yml /app/
COPY . /app/

# Installing packages
RUN pip install rasa==3.1

# Ports
EXPOSE 5005 5055

# Training models
RUN rasa train

CMD [ "/bin/sh", "-c", "./script.sh" ]