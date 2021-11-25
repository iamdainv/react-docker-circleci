FROM node:14-alpine as node-builder
WORKDIR /app
COPY . /app/
RUN npm install && npm run build

FROM nginx:latest
COPY --from=node-builder /app/build /usr/share/nginx/html

