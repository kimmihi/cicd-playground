FROM node:14-alpine as builder

WORKDIR /app

COPY package.json /app
COPY package-lock.json /app

RUN yarn install

COPY . /app
RUN yarn build

FROM nginx:latest
COPY --from=builder /app/build /usr/share/nginx/html

EXPOSE 80
