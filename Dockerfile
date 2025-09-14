FROM node:18
WORKDIR /app

COPY bookmyshow-app/package.json bookmyshow-app/package-lock.json ./

RUN npm install postcss@8.4.21 postcss-safe-parser@6.0.0 --legacy-peer-deps
RUN npm install

COPY . .

ENV NODE_OPTIONS=--openssl-legacy-provider
ENV PORT=3000

EXPOSE 3000

CMD ["npm", "start"]
