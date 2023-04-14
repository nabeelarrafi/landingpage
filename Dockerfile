FROM node:lts-alpine as build-stage
WORKDIR /app
COPY package*.json ./
RUN apk add --update npm
RUN npm install
COPY . /app
RUN npm run build

# production stage
FROM nginx:stable-alpine as production-stage
COPY --from=build-stage . /usr/share/nginx/html
RUN rm /etc/nginx/conf.d/default.conf
COPY ./nginx/nginx.conf /etc/nginx/conf.d

CMD ["nginx", "-g", "daemon off;"]