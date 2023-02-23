FROM node:alpine AS build

WORKDIR /app

COPY package*.json ./
#find files that match the pattern package*.json and copy them to the current working directory

RUN npm install
COPY . ./
#copy all files from the current directory to the current working directory

#RUN npm run build

FROM nginx
COPY --from=build /app/public /usr/share/nginx/html