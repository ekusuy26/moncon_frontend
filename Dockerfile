FROM node:18.18.2-alpine

WORKDIR /app

RUN yarn install

CMD ["yarn","dev"]
