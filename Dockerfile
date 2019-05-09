FROM node:12

COPY ./stage1-matrix-react-sdk.sh .
RUN ./stage1-matrix-react-sdk.sh

COPY ./stage2-riot-web.sh .
RUN ./stage2-riot-web.sh


FROM httpd:2

COPY --from=0 ./riot.tgz /tmp/riot.tgz
RUN tar xz --strip-components=1 -C /usr/local/apache2/htdocs < /tmp/riot.tgz
