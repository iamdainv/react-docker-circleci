FROM node:14-stretch-slim as node-builder
WORKDIR /app
COPY . /app/
RUN npm install && npm run build

FROM nginx:latest
COPY --from=node-builder /app/build /usr/share/nginx/html

