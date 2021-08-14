# alternatively node:latest could also be used, but knowing a particular version is a good idea
FROM node:14
# using WORKDIR is recommended instead of mkdir and cd
# - https://www.educative.io/edpresso/what-is-the-workdir-command-in-docker
# - https://stackoverflow.com/questions/51066146/what-is-the-point-of-workdir-on-dockerfile#:~:text=IMO%2C%20it's%20also%20worth%20pointing,they%20don't%20exist%20already
WORKDIR /project 

# Copying all the repos, node_modules are being ignored via `dockerignore`
COPY frontend/ frontend
COPY backend/ backend

# Installing the frontend node_modules and Building the Frontend
# NOTE - Absolute paths should be used. Relative path does not work
WORKDIR /project/frontend
RUN yarn install
RUN yarn build

# Installing nginx and start it via "service"
RUN apt update && apt install -y nginx 
COPY nginx.conf /etc/nginx/sites-available/default
RUN service nginx start

# Installing the backend node_modules and running the backend
WORKDIR /project/backend
RUN npm install
RUN node index.js
