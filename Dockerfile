FROM node:10.15-alpine

RUN mkdir -p /root/app
COPY package.json /root/app
COPY yarn.lock /root/app
COPY pages /root/app/pages

ENV NODE_ENV=production

WORKDIR /root/app
RUN yarn && yarn build && rm -rf pages

CMD ["sh", "-c", "yarn start --port $PORT"]
