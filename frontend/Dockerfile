FROM node:16-alpine

WORKDIR /app

COPY app/ ./

RUN npm install


EXPOSE 4000

CMD [ "npm", "run", "dev", "--", "--host", "0.0.0.0", "--port", "4000" ]
