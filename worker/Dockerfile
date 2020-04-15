FROM node:alpine

WORKDIR '/app'

# install and cache app dependencies
COPY ./package.json /app/package.json
RUN npm install

# add app
COPY . .

# start app
CMD npm run start