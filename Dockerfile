FROM node:12

COPY ./build /tmp/build
RUN /tmp/build


FROM httpd:2

COPY --from=0 /tmp/riot.tgz /tmp/riot.tgz
RUN tar xz -C /usr/local/apache2/htdocs < /tmp/riot.tgz
