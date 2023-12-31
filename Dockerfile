FROM python:3.11-slim-bullseye

WORKDIR /usr/src/app

# install gcc
RUN apt-get update && \
    apt-get install -y g++

COPY requirements.txt ./
RUN pip install --no-cache-dir -r requirements.txt

COPY . .

CMD [ "python", "main.py" ]
