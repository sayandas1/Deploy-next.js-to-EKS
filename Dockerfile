FROM node:14-alpine

WORKDIR /app

COPY ./nextjs-material-kit-main/package*.json ./
RUN npm install

COPY ./nextjs-material-kit-main .

RUN npm run build

EXPOSE 3000

CMD ["npm", "start"]
