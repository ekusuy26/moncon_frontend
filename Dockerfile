FROM node:18.18.2-alpine

WORKDIR /app

COPY app/package.json /app/ \
    app/yarn.lock /app/

RUN yarn install

CMD ["yarn","dev"]
