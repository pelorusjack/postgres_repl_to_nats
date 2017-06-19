FROM node:8.1.2-alpine

ENV LAPIDUS_PATH /lapidus

WORKDIR $LAPIDUS_PATH

COPY package.json $LAPIDUS_PATH
COPY lapidus.json.template $LAPIDUS_PATH
COPY index.js $LAPIDUS_PATH


COPY startup.sh  $LAPIDUS_PATH
RUN chmod +x $LAPIDUS_PATH/startup.sh

RUN apk add --no-cache make gcc g++ python
RUN npm i -g lapidus  --unsafe 

RUN cd $LAPIDUS_PATH; npm install --unsafe
RUN apk del make gcc g++ python

CMD $LAPIDUS_PATH/startup.sh
