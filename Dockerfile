# Stage 1 - Build React App
FROM node:18

WORKDIR /app

COPY client/package*.json ./
RUN npm install

COPY client/ ./

# Fix for OpenSSL error
ENV NODE_OPTIONS=--openssl-legacy-provider

RUN npm run build

# Stage 2 - Serve with nginx
FROM nginx:alpine
COPY --from=0 /app/build /usr/share/nginx/html

EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]

