FROM node:18.18.2-alpine AS builder

# ARG graphql_endpoint

# # ビルドには devDependencies もインストールする必要があるため
# ENV NODE_ENV=development

# アプリに埋め込む環境変数
# ENV NEXT_PUBLIC_GRAPHQL_ENDPOINT=$graphql_endpoint

WORKDIR /app
COPY app/package.json ./
COPY app/yarn.lock ./
RUN yarn install
COPY ./app ./
RUN yarn build


FROM node:18.18.2-alpine AS runner
# ENV NODE_ENV=production

WORKDIR /app
COPY app/package.json ./
COPY app/yarn.lock ./
# NODE_ENV=productionにしてyarn install(npm install)するとdevDependenciesがインストールされません
RUN yarn install
COPY --from=builder /app/next.config.js ./
COPY --from=builder /app/.next ./.next
COPY --from=builder /app/public ./public

CMD ["yarn", "start"]
