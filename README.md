This is a Demo Repository to dockerize a React frontend and an express backend in a single container.

The two important files are:
`Dockerfile` contains the docker configuration
`nginx.conf` contains the Nginx that server frontend via static files, and backend via process running at PORT 5000 via `proxy_pass`
The above 2 files contain useful comments

## How to run

- Build a docker image - `docker build -t YOUR_APP_NAME:latest .`
- Running the image
  `docker run -p 8080:80 YOUR_APP_NAME:latest`
  All the requests to `http://localhost:8000` will be directed to PORT 80 of the docker image
- Frontend can be accessed at `http://localhost:8000`
- Backend can be accessed at `http://localhost:8000/api/ROUTE_NAME`(example `http://localhost:8000/api/single`)

## Credits

I could learn this because of help and guidance of these generous men - Mukul, Sahil, Himanshu, Harsh
