# client/Dockerfile

FROM node:18 as build

WORKDIR /app

COPY package*.json ./
RUN npm install

COPY . .

# ✅ Fix for Node.js OpenSSL issue
ENV NODE_OPTIONS=--openssl-legacy-provider

RUN npm run build

# Use nginx to serve the build
FROM nginx:alpine
COPY --from=build /app/build /usr/share/nginx/html

EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]

