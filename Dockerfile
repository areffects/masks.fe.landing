FROM mhart/alpine-node:12 AS builder

ARG NODE_ENV
ENV NODE_ENV ${NODE_ENV:-'production'}

ARG API_URL
ENV API_URL ${API_URL}

WORKDIR /landing

COPY package.json .
COPY yarn.lock .

RUN yarn --frozen-lockfile --production=false

COPY . .

RUN yarn build
