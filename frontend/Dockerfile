# frontend/Dockerfile
FROM node:18-bullseye AS build
WORKDIR /app
COPY package*.json ./

# install python and build tools
RUN apt-get update && apt-get install -y python3 make g++ \
    && npm install \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

COPY . .
RUN npm run build

FROM nginx:stable-alpine
COPY --from=build /app/dist /usr/share/nginx/html
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]