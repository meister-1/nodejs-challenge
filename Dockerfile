FROM node:11

RUN mkdir -p /usr/src/app

WORKDIR /usr/src/app

ENV PATH ./node_modules/.bin:$PATH

COPY package.json .
RUN npm install

COPY  .babelrc .
COPY  .eslintrc.yml .
COPY src ./src/

RUN eslint ./src
RUN babel src -d dist

EXPOSE 9005

CMD ["node", "dist/index.js"]