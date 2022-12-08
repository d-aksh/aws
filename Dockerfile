FROM ubuntu as build-step 

COPY . /app

from nginx

copy --from=build-step /app/Aws-html /usr/share/nginx/html
