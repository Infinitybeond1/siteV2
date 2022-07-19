FROM nimlang/nim:latest

WORKDIR /site

COPY . .

EXPOSE 5000

CMD [ "nimble", "run" ]
