FROM node:lts-alpine

WORKDIR /app

COPY package*.json ./

COPY frontend/package*.json frontend/
RUN npm install --prefix frontend

COPY backend/package*.json backend/
RUN npm install

COPY frontend/ frontend/
RUN npm run build --prefix frontend

COPY ./ ./

USER node

CMD [ "npm", "start"]

EXPOSE 5000