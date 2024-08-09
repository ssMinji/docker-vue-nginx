FROM node:lts-alpine as builder
WORKDIR /app

COPY package*.json ./

RUN npm install

COPY . .

RUN npm run build 

# FROM nginx:stable-alpine
# RUN rm -rf /etc/nginx/conf.d/default.conf
# COPY --from=builder /app/nginx/default.conf /etc/nginx/conf.d/default.conf

# RUN rm -rf /usr/share/nginx/html/*
# COPY --from=builder /app/dist /usr/share/nginx/html
RUN npm install -g http-server

EXPOSE 8080
# ENTRYPOINT ["nginx", "-g", "daemon off;"]
CMD ["http-server", "dist"]