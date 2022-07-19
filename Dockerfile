FROM nimlang/nim:devel

WORKDIR /site

COPY . .

EXPOSE 5000

CMD [ "nimble", "run" ]
