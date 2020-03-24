# builder
FROM node:alpine as builder
WORKDIR '/app'
COPY package.json .
RUN npm install
COPY . .
RUN npm run build

# runner
FROM nginx
EXPOSE 80
COPY --from=builder /app/build /usr/share/nginx/html