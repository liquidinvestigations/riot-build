FROM node:12

COPY ./stage1-matrix-react-sdk.sh /tmp/stage1.sh
RUN /tmp/stage1.sh

COPY ./stage2-riot-web.sh /tmp/stage2.sh
RUN /tmp/stage2.sh


FROM httpd:2

COPY --from=0 /tmp/riot.tgz /tmp/riot.tgz
RUN tar xz --strip-components=1 -C /usr/local/apache2/htdocs < /tmp/riot.tgz
