# Build phase

FROM node:16-alpine as builder

WORKDIR /app

COPY package.json .
RUN npm install

# Not needed since we're using volumes
COPY . .

RUN npm run build


# Run phase
FROM nginx
EXPOSE 80
COPY --from=builder /app/build/ /usr/share/nginx/html/
