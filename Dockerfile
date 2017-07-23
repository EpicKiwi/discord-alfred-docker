FROM pipill/armhf-node:8
#FROM node:8

COPY ./discord-alfred /home/discord-alfred
COPY ./settings.json /home/discord-alfred/settings.json

RUN apt-get update -y && \
    apt-get install autoconf -y && \
    apt-get install libtool -y && \
    apt-get install python -y

RUN apt-get install build-essential -y

RUN cd /home/discord-alfred && \
    npm i

WORKDIR /home/discord-alfred/src

CMD ["node","bot.js"]