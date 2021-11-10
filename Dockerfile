FROM nginx:1.21.3

RUN mkdir /etc/nginx/sites-available \
    && ln -sr /etc/nginx/sites-available /etc/nginx/sites-enabled

COPY conf/ /etc/nginx/
COPY nvhosts.toml .

ADD https://github.com/mlcdf/nvhosts/releases/download/v0.5.0/nvhosts-v0.5.0-linux-amd64 nvhosts
RUN chmod +x nvhosts && ./nvhosts && mv sites-available/* /etc/nginx/sites-available/

EXPOSE 8080
