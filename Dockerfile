# the base image I'll use to build this node app
FROM node:6-alpine

# I'm exposing the port 3000 of the container to be mapped later with port 80 of the host 
EXPOSE 3000

# install tini form apk package manager
RUN apk add --no-cache tini

# cd to the path below
RUN  mkdir -p /usr/src/app 
WORKDIR /usr/src/app

# copying the package file form the dockerfile dir to the working dir in the app
COPY package.json package.json

# install the dependencies 
RUN npm install \
&& npm cashe clean --force

# copying all the files in the dockerfile dir to the app working dir
COPY . .

# the last command: what the container start with
CMD [ "/sbin/tini","-- ", "node","./bin/www" ]




