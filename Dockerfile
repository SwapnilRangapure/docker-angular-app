#Stage 1 compile source code 
FROM node:latest as node
WORKDIR /usr/local/app
#copy source code folder 
COPY . .
#will install package dependency mentioned in .json files
RUN npm install
#will compile app
RUN npm run build

#Stage 2 run compile source code from stage1
FROM nginx:latest
#using stage 1 compiled app and copy to nginx default html
COPY --from=node /usr/local/app/dist/angular-app /usr/share/nginx/html
#eposing nginx port 80 to docker host machine
EXPOSE 80


