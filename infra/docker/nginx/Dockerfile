FROM nginx:1.25.3

LABEL author="Moustakime KIFIA"
RUN rm /etc/nginx/conf.d/default.conf

COPY /infra/docker/nginx/nginx.conf /etc/nginx/nginx.conf
COPY /infra/docker/nginx/default.conf /etc/nginx/conf.d/default.conf

COPY /front/dist/membership/browser /usr/share/nginx/html

WORKDIR /usr/share/nginx/html
RUN chmod -R 755 /usr/share/nginx/html

EXPOSE 80 443

ENTRYPOINT ["nginx", "-g", "daemon off;"]
