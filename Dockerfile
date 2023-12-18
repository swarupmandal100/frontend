FROM node:21-alpine as builder

WORKDIR /usr/app

COPY ./package.json ./

RUN npm install

COPY ./ ./

CMD ["npm", "run", "build"]


FROM nginx
COPY --from=builder /usr/app/build /usr/share/nginx/html
# No Need to provide any startup command or port opening, nginx will do it by itself
#  when nginx container creates