FROM node:latest
LABEL maintainer="adrian.durran@digital.cabinet-office.gov.uk"
ENV NPM_CONFIG_LOGLEVEL warn
RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app
COPY server/package.json /usr/src/app
RUN npm install
COPY /server/. /usr/src/app
COPY /client/build/. /user/src/app/client
EXPOSE 5090
CMD ["node","index.js"]