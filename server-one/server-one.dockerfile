FROM node:20

RUN mkdir -p /home/node/server-one/node_modules && chown -R node:node /home/node/server-one
WORKDIR /home/node/server-one
COPY package*.json ./

USER node
RUN npm install

COPY --chown=node:node . .

EXPOSE 80
# ENTRYPOINT ["node", "server-one.js", "--bind=0.0.0.0", "--listen=3001"]
CMD ["node", "server-one.js"]
# CMD ["/start.sh"]

# ENV APP_ENV production
