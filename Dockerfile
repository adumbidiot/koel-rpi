FROM resin/rpi-raspbian

RUN git clone https://github.com/phanan/koel
RUN cd koel && composer install
RUN cd koel && php artisan koel:init
