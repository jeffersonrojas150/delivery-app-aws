FROM node:10-alpine

RUN mkdir -p /home/node/app/node_modules && chown -R node:node /home/node/app

WORKDIR /home/node/app

COPY package*.json ./

USER node

RUN npm install

COPY --chown=node:node . .

# Dar permisos de ejecución al script de espera
RUN chmod +x ./wait-for.sh

EXPOSE 8080

CMD [ "node", "app.js" ]
