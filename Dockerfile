FROM python:3.10.11-bullseye

WORKDIR /usr/src/app

ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1

RUN apt update && apt upgrade -y \
    && apt install gcc python3-dev musl-dev bash build-essential libssl-dev libffi-dev -y

RUN pip install --upgrade pip
COPY ./requirements.txt .
RUN pip install -r requirements.txt

COPY . .

CMD ["tail", "-f", "/dev/null"]