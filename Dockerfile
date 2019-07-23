#stage one
FROM node:latest as node
WORKDIR /app
COPY . . 
RUN npm install 
RUN npm run build --prod

#stage two
FROM nginx:alpine
COPY --from=node /app/dist/docker-demo-code /usr/share/nginx/html