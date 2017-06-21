FROM node:8.1.2-alpine

ENV LAPIDUS_PATH /lapidus

WORKDIR $LAPIDUS_PATH

COPY package.json $LAPIDUS_PATH
COPY lapidus.json.template $LAPIDUS_PATH
COPY index.js $LAPIDUS_PATH


COPY startup.sh  $LAPIDUS_PATH
RUN chmod +x $LAPIDUS_PATH/startup.sh

RUN apk update \
    && apk add --no-cache git make gcc g++ python postgresql postgresql-client postgresql-dev

RUN npm i -g lapidus  --unsafe 

RUN cd $LAPIDUS_PATH; npm install --unsafe
RUN apk del git make gcc g++ python

CMD $LAPIDUS_PATH/startup.sh
