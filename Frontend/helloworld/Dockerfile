# build stage
FROM node:21 AS build-stage

ARG mode='production'
WORKDIR /app
COPY package*.json ./
RUN npm install
COPY . .
RUN npm run build --${mode}

# production stage
FROM nginx:stable-alpine AS production-stage
COPY --from=build-stage /app/dist /usr/share/nginx/html
COPY nginx.conf /etc/nginx/nginx.conf
EXPOSE 8080
CMD ["nginx", "-g", "daemon off;"]