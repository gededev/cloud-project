FROM node:12.18.1
ENV NODE_ENV production
ENV MONGO_DB_USERNAME=admin \
    MONGO_DB_PWD=password
WORKDIR /usr/src/app
COPY ["package.json", "package-lock.json", "./"]
RUN npm install --production --silent && mv node_modules ../
COPY . .
EXPOSE 3000
CMD npm start