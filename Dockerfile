FROM resin/rpi-raspbian

RUN apt-get update
RUN apt-get install git

RUN git clone https://github.com/phanan/koel
RUN cd koel && composer install
RUN cd koel && php artisan koel:init
