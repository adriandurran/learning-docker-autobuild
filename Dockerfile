FROM node:latest
LABEL maintainer="adrian.durran@digital.cabinet-office.gov.uk"
ENV NPM_CONFIG_LOGLEVEL warn
RUN mkdir -p /usr/src/app
COPY /server/. /usr/src/app
COPY /client /usr/src/app
WORKDIR /usr/src/app
RUN npm install
WORKDIR /usr/src/app/client
RUN npm install
RUN npm run build --production
WORKDIR /usr/src/app
EXPOSE 5090
CMD ["node","index.js"]