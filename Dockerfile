# stage 1
FROM node:10 as node
WORKDIR /app
COPY . .
RUN npm install
RUN npm rebuild node-sass
RUN npm run build --prod

# stage 2
FROM nginx:alpine
COPY --from=node /app/dist/recuapp /usr/share/nginx/html
CMD [ "nginx", "-g", "daemon off;" ]
