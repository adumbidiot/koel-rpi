FROM resin/rpi-raspbian

RUN apt-get update
RUN apt-get install git curl php5

RUN curl -sS https://getcomposer.org/installer | sudo php -- --install-dir=/usr/local/bin --filename=composer
RUN git clone https://github.com/phanan/koel
RUN cd koel && composer install
RUN cd koel && php artisan koel:init
