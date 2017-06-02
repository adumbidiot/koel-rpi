FROM resin/rpi-raspbian

RUN apt-get update
RUN apt-get install git curl php5 php5-curl

RUN curl -sS https://getcomposer.org/installer | sudo php -- --install-dir=/usr/local/bin --filename=composer

RUN git clone https://github.com/phanan/koel

RUN cd koel && touch .env
RUN cd koel && echo ADMIN_EMAIL=nathaniel.daniel23@outlook.com >> .env
RUN cd koel && echo ADMIN_NAME=admin >> .env
RUN cd koel && echo ADMIN_PASSWORD=password >> .env
RUN cd koel && echo DB_CONNECTION=mysql >> .env
RUN cd koel && echo DB_HOST=192.168.1.11 >> .env
RUN cd koel && echo DB_DATABASE=koel >> .env
RUN cd koel && echo DB_USERNAME=root >> .env
RUN cd koel && echo DB_PASSWORD=pass >> .env

RUN cd koel && cat .env

RUN cd koel && composer install
RUN cd koel && php artisan koel:init
