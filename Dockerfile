# BUILD PHASE
FROM node:10.17.0 as builder

WORKDIR '/app'

# add `/app/node_modules/.bin` to $PATH
ENV PATH /app/node_modules/.bin:$PATH

# install and cache app dependencies
COPY ./package.json /app/package.json
RUN npm install
RUN npm install -g @angular/cli@8.3.26

# add app
COPY . /app

# BUILD
RUN ng build --prod --deploy-url=/karya/ 

# RUN PHASE
FROM nginx

COPY ./nginx.conf /etc/nginx/nginx.conf

## Remove default nginx index page
RUN rm -rf /usr/share/nginx/html/* && mkdir -p /usr/share/nginx/html/karya

# Copy from the stahg 1
COPY --from=builder /app/dist /usr/share/nginx/html

EXPOSE 80

ENTRYPOINT ["nginx", "-g", "daemon off;"]