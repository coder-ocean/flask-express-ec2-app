FROM python:3.10.20-alpine3.22

WORKDIR /app

ADD . .

RUN pip3 install -r requirements.txt

ENTRYPOINT [ "python3" ]

CMD [ "app.py" ]